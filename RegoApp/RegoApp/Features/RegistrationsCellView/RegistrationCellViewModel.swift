//
//  RegistrationCellViewModel.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import Foundation

class RegistrationCellViewModel {
    
    let registrationModel: RegistrationElement
    init(model: RegistrationElement) {
        registrationModel = model
    }
    
    var plateNumber: String {
        return registrationModel.plateNumber
    }
    
    var expiryDate: String {
        return registrationModel.registration.displayDate
    }
    
    var makeModelDetail: String {
        let vehicle = registrationModel.vehicle
        let detailInfo = [vehicle.colour.uppercased(), vehicle.make.uppercased(), vehicle.model.uppercased()]
        return detailInfo.joined(separator: " ")
    }
}
