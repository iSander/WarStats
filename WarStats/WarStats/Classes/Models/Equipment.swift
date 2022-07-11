//
//  Equipment.swift
//  WarStats
//
//  Created by Alex Sander on 11.07.2022.
//

import Foundation

struct Equipment: Codable {
    let date: String?
    let day: Int?
    let aircraft: Int?
    let helicopter: Int?
    let tank: Int?
    let apc: Int?
    let fieldArtillery: Int?
    let mrl: Int?
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let mobileSRBMSystem: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?

    enum CodingKeys: String, CodingKey {
            case date, day, drone, aircraft, helicopter, tank
            case apc = "APC"
            case fieldArtillery = "field artillery"
            case mrl = "MRL"
            case militaryAuto = "military auto"
            case fuelTank = "fuel tank"
            case navalShip = "naval ship"
            case antiAircraftWarfare = "anti-aircraft warfare"
            case specialEquipment = "special equipment"
            case mobileSRBMSystem = "mobile SRBM system"
            case vehiclesAndFuelTanks = "vehicles and fuel tanks"
            case cruiseMissiles = "cruise missiles"
        }
}
