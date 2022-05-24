//
//  DatabaseManager.swift
//  ReviewRestaurants
//
//  Created by admin on 5/23/22.
//

import Foundation
import UIKit
import FMDB

final class DatabaseManager: NSObject {
    
    
    // MARK: Variables
    
    private let _databaseFileName = "reviewRestaurants.sqlite"
    
    private var _pathToDatabase: String!
    
    private var _dbQueue: FMDatabaseQueue!
    
    
    // MARK: Singleton
    
    static let shared = DatabaseManager()
    
    
    // MARK: Initialziers
    
    override init() {
        super.init()
        
        if let documentsDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first {
            _pathToDatabase = documentsDirectory.appending("/\(_databaseFileName)")
        }
        
        _dbQueue = FMDatabaseQueue.init(path: _pathToDatabase)
        
        self.createTables()
    }
    
    
    // MARK: Insert Methods
    
    func insertRestaurants(_ restaurants: [Restaurant]) {
        _dbQueue.inTransaction { db, rollback in
            do {
//                db.executeStatements("DELETE FROM restaurants")
                
                for restaurant in restaurants {
                    try db.executeUpdate(insertRestaurantsQuery, values: [restaurant.name])
                }
            } catch {
                rollback.pointee = true
            }
        }
    }
    
    // MARK: Update Methods
    
    
    
    // MARK: Fetch Methods
    
    func restaurantsFromDb() -> [Restaurant] {
        var rests: [Restaurant] = []
        
        _dbQueue.inTransaction { db, rollback in
            rests = Restaurant.getRestaurantsFromDbSet(db.executeQuery(Restaurant.selectRestaurants, withArgumentsIn: []))
        }
        
        return rests
    }
    
    
    // MARK: Private Methods
    
    private func createTables() {
        _dbQueue.inTransaction { (db, rollback) in
            db.executeStatements(createTableQuery)
        }
    }
    
    
    // MARK: Private Helpers
    
    private var createTableQuery: String {
        return """
           \(Restaurant.createTableQuery)
           \(User.createTableQuery)
        """
        
    }

    var insertRestaurantsQuery: String {
            return """
               INSERT INTO \(DatabaseTables.restaurants)
               (
                \(DatabaseFields.restaurantName)
               )
               VALUES (?);
               """
    }
    
    var values: [Any] {
        return [
            "Example Restaurant"
        ]
    }
    
    
}
