//
//  RegistrationsResponse.swift
//  RegoApp
//
//  Created by Shamas on 28/9/20.
//

import Foundation

// MARK: - Welcome
struct RegistrationsResponse: Codable {
    let registrations: [RegistrationElement]
}

// MARK: - RegistrationElement
struct RegistrationElement: Codable {
    let plateNumber: String
    let registration: RegistrationDetail
    let vehicle: Vehicle
    let insurer: Insurer

    enum CodingKeys: String, CodingKey {
        case plateNumber = "plate_number"
        case registration, vehicle, insurer
    }
}

// MARK: - Insurer
struct Insurer: Codable {
    let name: String
    let code: Int
}

enum VehicleType: String, Codable {
    case sedan = "Sedan"
    case hatch = "Hatch"
    case suv = "SUV"
    case truck = "Truck"
    case wagon = "Wagon"
}

// MARK: - RegistrationRegistration
struct RegistrationDetail: Codable {
    let expired: Bool
    let expiryDate: String

    var displayDate: String {
        return Date.formattedDateFromString(dateString: expiryDate)
    }
    
    enum CodingKeys: String, CodingKey {
        case expired
        case expiryDate = "expiry_date"
    }
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
