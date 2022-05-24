//
//  Restaurant+Database.swift
//  ReviewRestaurants
//
//  Created by admin on 5/23/22.
//

import Foundation
import FMDB

extension Restaurant {
    
    static var createTableQuery: String {
        return """
        CREATE TABLE IF NOT EXISTS \(DatabaseTables.restaurants)
        (
        \(DatabaseFields.id)INTEGER PRIMARY KEY AUTOINCREMENT,
        \(DatabaseFields.restaurantName) TEXT
        );
        """
    }
    
    static var selectRestaurants: String {
        return """
        SELECT * FROM \(DatabaseTables.restaurants)
        """
    }
    
    static func getRestaurantsFromDbSet(_ set: FMResultSet?) -> [Restaurant] {
        guard let set = set else {
            return []
        }
        
        var rests: [Restaurant] = []
        
        while (set.next()) {
            rests.append(Restaurant(set: set))
        }
        
        return rests
    }
    
}
