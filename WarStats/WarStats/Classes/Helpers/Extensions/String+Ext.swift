//
//  String+Ext.swift
//  WarStats
//
//  Created by Alex Sander on 12.07.2022.
//

import Foundation

extension String {
    
    func toDate(withFormat format: String = "yyyy-MM-dd") -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        
        return date
    }
    
    func toJSON() -> Any? {
        
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
