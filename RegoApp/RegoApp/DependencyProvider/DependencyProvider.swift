//
//  DependencyProvider.swift
//  RegoApp
//
//  Created by Shamas on 28/9/20.
//

import Foundation

protocol Provider {
    
    static func getRouter() -> Routable
    
    static func getService() -> WebService
}

class DependencyProvider: Provider {
    
    static func getRouter() -> Routable {
        return RegistrationsListRouter()
    }
    
    static func getService() -> WebService {
        return RegistrationsListService()
    }
}
