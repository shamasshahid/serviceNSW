//
//  MockProvider.swift
//  RegoAppTests
//
//  Created by Shamas on 29/9/20.
//

import Foundation

@testable import RegoApp

class MockProvider: Provider {
    static func getRouter() -> Routable {
        return RegistrationsListRouter()
    }
    
    static func getService() -> WebService {
        return MockService()
    }
    
    
}

