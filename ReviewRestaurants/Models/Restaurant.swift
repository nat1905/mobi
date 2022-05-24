//
//  Restaurant.swift
//  ReviewRestaurants
//
//  Created by admin on 5/23/22.
//

import Foundation
import UIKit
import FMDB

class Restaurant: NSObject {
    
    var image: UIImage
    
    var name: String
    
    public init(image: UIImage = UIImage(named: "back-button-icon") ?? UIImage(), name: String) {
        self.image = image
        self.name = name
        
        super.init()
    }
    
    public init(set: FMResultSet) {
        self.name = String(set.string(forColumn: "restaurant_name") ?? "")
        self.image = UIImage()
        super.init()
    }
}


