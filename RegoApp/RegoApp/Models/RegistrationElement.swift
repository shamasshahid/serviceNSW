//
//  RegistrationElement.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import Foundation

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
