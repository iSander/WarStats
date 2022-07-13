//
//  Date+Ext.swift
//  WarStats
//
//  Created by Alex Sander on 13.07.2022.
//

import Foundation

extension Date {

    func toString(withFormat format: String = "yyyy-MM-dd") -> String { // "EEEE ، d MMMM yyyy"

        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale(identifier: "fa-IR")
//        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
//        dateFormatter.calendar = Calendar(identifier: .persian)
        dateFormatter.dateFormat = format
        let str = dateFormatter.string(from: self)

        return str
    }
}
