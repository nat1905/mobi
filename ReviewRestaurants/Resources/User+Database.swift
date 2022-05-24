//
//  User+Database.swift
//  ReviewRestaurants
//
//  Created by admin on 5/23/22.
//

import Foundation
import FMDB

extension User {
    static var createTableQuery: String {
        return """
        CREATE TABLE IF NOT EXISTS \(DatabaseTables.users)
        (
        \(DatabaseFields.id)INTEGER PRIMARY KEY AUTOINCREMENT,
        \(DatabaseFields.name) TEXT NOT NULL,
        \(DatabaseFields.email) TEXT NOT NULL,
        \(DatabaseFields.password) TEXT NOT NULL
        );
        """
    }
    static var selectUsers: String {
        return """
        SELECT * FROM \(DatabaseTables.users)
        """
    }
    
    static func getUsersFromDbSet(_ set: FMResultSet?) -> [User] {
        guard let set = set else {
            return []
        }
        
        var users: [User] = []
        
        while (set.next()) {
            users.append(User(set: set))
        }
        
        return users
    }}
