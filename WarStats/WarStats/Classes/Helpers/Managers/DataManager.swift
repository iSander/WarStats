//
//  DataManager.swift
//  WarStats
//
//  Created by Alex Sander on 20.07.2022.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    func getPersonnel(from jsonFile: String) -> [Personnel] {
        
        var array = [Personnel]()
        
        if let fileURL = Bundle.main.url(forResource: jsonFile, withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                
                do {
                    array = try JSONDecoder().decode([Personnel].self, from: jsonData)
                } catch {
                    print(error)
                }
            }
        }
        
        return array
    }
    
    func getEquipment(from jsonFile: String) -> [Equipment] {
        
        var array = [Equipment]()
        
        if let fileURL = Bundle.main.url(forResource: jsonFile, withExtension: "json") {
            if let jsonData = try? Data(contentsOf: fileURL) {
                
                // replacing NaN -> 0
                var jsonString = String(data: jsonData, encoding: .utf8)
                jsonString = jsonString?.replacingOccurrences(of: "NaN", with: "0")

                let arrayWithDict = jsonString?.toJSON() as? [Dictionary<String, AnyObject>]
                for dict in arrayWithDict ?? [] {
                    let equipment = Equipment(with: dict)
                    array.append(equipment)
                }
            }
        }
        
        return array
    }
}
