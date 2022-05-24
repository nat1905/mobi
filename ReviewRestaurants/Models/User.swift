//
//  User.swift
//  ReviewRestaurants
//
//  Created by admin on 5/23/22.
//

import Foundation
import UIKit
import FMDB

final class User: NSObject {
    
    var name: String
    var email: String
    var password: String
    
    public init(name: String, email: String, password: String) {
        self.email = email
        self.name = name
        self.password = password
        
        super.init()
    }
    
    public init(set: FMResultSet) {
        self.name = String(set.string(forColumn: DatabaseFields.name) ?? "")
        self.email = String(set.string(forColumn: DatabaseFields.email) ?? "")
        self.password = String(set.string(forColumn: DatabaseFields.password) ?? "")
        super.init()
    }

}
