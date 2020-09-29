//
//  DependencyProvider.swift
//  RegoApp
//
//  Created by Shamas on 28/9/20.
//

import Foundation

protocol Provider {
    
    /// Get Router object for backend access
    static func getRouter() -> Routable
    
    /// Get WebSerivce instance
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
