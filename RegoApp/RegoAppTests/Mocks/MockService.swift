//
//  MockService.swift
//  RegoAppTests
//
//  Created by Shamas on 29/9/20.
//

import Foundation
@testable import RegoApp

class MockService: CommonTestCase, WebService {
    
    var mockContentData: Data {
        return getData(name: "registrationsResponse")
    }
    
    func fetch(urlRequest: Routable, completionHandler: @escaping (Result<[RegistrationElement], ServiceError>) -> Void) {
        let mockData = try? JSONDecoder().decode(RegistrationsResponse.self, from: mockContentData)
        if let data = mockData {
            completionHandler(.success(data.registrations))
        }
    }
}
