//
//  RegistrationsListViewModel.swift
//  RegoApp
//
//  Created by Shamas on 28/9/20.
//

import Foundation

class RegistrationsListViewModel {
    
    private let router: Routable
    private let service: WebService
    private var registrationsList: [RegistrationElement] = [] {
        didSet {
            self.onDataUpdated?()
        }
    }
    
    var onDataUpdated: (() -> Void)?
    
    var rowCount: Int {
        return registrationsList.count
    }
    
    init(router: Routable, service: WebService) {
        self.router = router
        self.service = service
    }
    
    func requestData() {
        service.fetch(urlRequest: router) { [weak self] result in
            switch result {
            case .success(let registrationsResponse):
                self?.registrationsList = registrationsResponse
            case .failure(let error):
                print("xxx error\(error)")
            }
        }
    }
    
    private func getModelForIndex(index: Int) -> RegistrationElement? {
        guard index >= 0 && index < registrationsList.count else {
            return nil
        }
        return registrationsList[index]
    }
    
    func getRegistrationDetailViewModel(index: Int) -> RegistrationDetailViewModel? {
        guard let model = getModelForIndex(index: index) else {
            return nil
        }
        return RegistrationDetailViewModel(registrationModel: model)
    }
    
    func getRegistrationViewModel(index: Int) -> RegistrationCellViewModel? {
        
        guard let model = getModelForIndex(index: index) else {
            return nil
        }
        return RegistrationCellViewModel(model: model)
    }
    
}
