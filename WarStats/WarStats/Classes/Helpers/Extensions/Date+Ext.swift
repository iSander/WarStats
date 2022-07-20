//
//  Date+Ext.swift
//  WarStats
//
//  Created by Alex Sander on 13.07.2022.
//

import Foundation

extension Date {

    func toString(withFormat format: String = "yyyy-MM-dd") -> String {

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
