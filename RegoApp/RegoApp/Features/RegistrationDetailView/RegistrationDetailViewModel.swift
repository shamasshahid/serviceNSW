//
//  RegistrationDetailViewModel.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import Foundation

class RegistrationDetailViewModel {
    
    let model: RegistrationElement
    
    init(registrationModel: RegistrationElement) {
        model = registrationModel
    }
    
    var numberOfRows: Int {
        return 3
    }
    
    func getDetailCellViewModel() -> RegistrationDetailCellViewModel {
        return RegistrationDetailCellViewModel(model: model)
    }
}
