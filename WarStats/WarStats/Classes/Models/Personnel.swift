//
//  Personnel.swift
//  WarStats
//
//  Created by Alex Sander on 11.07.2022.
//

import Foundation

struct Personnel: Codable {
    let date: String?
    let day: Int?
    let personnel: Int?
    let personnelPrefix: String?
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case personnelPrefix = "personnel*"
        case pow = "POW"
    }
}
