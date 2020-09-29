//
//  RegistrationsListRouter.swift
//  RegoApp
//
//  Created by Shamas on 28/9/20.
//

import Foundation

/// Implements Routable protocol and is used to get the urlRequest
struct RegistrationsListRouter: Routable {
    
    var methodType: HTTPType {
        return .GET
    }
    
    var scheme: RoutableScheme {
        return .https
    }
    
//    https://bit.ly/3fqZZ3Y
    var baseURL: String {
        return "bit.ly"
    }
    
    var path: String {
        return "/3fqZZ3Y"
    }
    
    var queryItems: [URLQueryItem] = []
    
    var headers: [String : Any] {
        return [:]
    }
    
    
    /// Creates a URLRequest object using the implemented Routable protocol
    /// - Throws: RouteError
    /// - Returns: URLRequest
    func asURLRequest() throws -> URLRequest {
        
        var components = URLComponents()
        components.scheme = scheme.rawValue
        components.host = baseURL
        components.path = path
        components.queryItems = queryItems
        
        guard let url = components.url else{
            throw RouteError.invalidRoute
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = methodType.rawValue
        
        for headerField in headers.keys {
            request.setValue(headers[headerField] as? String, forHTTPHeaderField: headerField)
        }
        
        return request
    }
}
