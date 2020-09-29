//
//  Vehicle.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import Foundation

enum VehicleType: String, Codable {
    case sedan = "Sedan"
    case hatch = "Hatch"
    case suv = "SUV"
    case truck = "Truck"
    case wagon = "Wagon"
}

// MARK: - Vehicle
struct Vehicle: Codable {
    let type: VehicleType
    let make, model, colour: String
    let vin: String
    let tareWeight: Int
    let grossMass: Int?

    enum CodingKeys: String, CodingKey {
        case type, make, model, colour, vin
        case tareWeight = "tare_weight"
        case grossMass = "gross_mass"
    }
}
