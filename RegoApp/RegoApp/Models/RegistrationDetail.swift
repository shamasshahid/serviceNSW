//
//  RegistrationDetail.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import Foundation

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
