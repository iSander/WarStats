//
//  Equipment.swift
//  WarStats
//
//  Created by Alex Sander on 11.07.2022.
//

import Foundation

struct Equipment {
    let date: String?
    let day: Int?
    var array = [Dictionary<String, AnyObject>]()
    
    init(with dict: Dictionary<String, AnyObject>) {
        date = dict["date"] as? String
        day = dict["day"] as? Int
        for (k, v) in dict {
            if (k != "date") && (k != "day") && (v as! Int != 0) {
                array.append([k: v])
            }
        }
    }
}
