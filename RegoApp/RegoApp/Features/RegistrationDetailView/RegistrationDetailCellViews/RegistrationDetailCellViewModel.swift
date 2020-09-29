//
//  RegistrationDetailCellViewModel.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import Foundation

enum DisplayText: String {
    case kg = "Kg"
}

class RegistrationDetailCellViewModel {
    
    private let model: RegistrationElement
    
    init(model: RegistrationElement) {
        self.model = model
    }
    
    var plateNumber: String {
        return model.plateNumber.uppercased()
    }
    
    var makeModelDetail: String {
        let vehicle = model.vehicle
        var detailString = vehicle.colour.uppercased()
        detailString.append(" \(vehicle.model.uppercased())")
        detailString.append(" \(vehicle.make.uppercased())")
        detailString.append(" \(vehicle.type.rawValue.uppercased())")
        return detailString
    }
    
    var expiryDate: String {
        return model.registration.displayDate
    }
    
    var vinDetail: String {
        return "*******" + model.vehicle.vin.suffix(4)
    }
    
    var insurerName: String {
        return model.insurer.name
    }
    
    var weight: String {
        return "\(model.vehicle.tareWeight) " + DisplayText.kg.rawValue
    }
    
    var mass: String {
        if let mass = model.vehicle.grossMass {
            return "\(mass) " + DisplayText.kg.rawValue
        } else {
            return "-"
        }
    }
}
