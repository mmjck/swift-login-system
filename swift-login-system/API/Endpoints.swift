//
//  Endpoints.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 19/09/23.
//

import Foundation


enum Endpoint  {
    
    case createAccount(path: String = "auth/signup", userRequest: RegisterUserRequest)
//    case createAccount(path: String = "auth/singin")
    
    var request: URLRequest? {
        guard let url = self.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = self.httpMethod
        request.addValues(for: self)
        request.httpBody = self.httpBody
//        request.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        return request
    }
    
    
    
    private var url: URL? {
        var components = URLComponents()
        
        components.scheme = Constants.scheme
        components.host = Constants.baseURL
        components.port = Constants.port
        components.path = self.path
        return components.url
    }
    
    
    
    private var path: String {
        switch self {
        case .createAccount(let path, _):
            return path
        }
    }
    
    
    private var httpMethod: String {
        switch self {
        case .createAccount:
            return HTTP.Method.post.rawValue
        }
    }
    
    
    private var httpBody: Data?{
        
        switch self {
        case .createAccount(_, let userRequest):
            return try? JSONEncoder().encode(userRequest)
        }
        
    }
}


extension URLRequest {
    mutating func addValues(for endpoint: Endpoint){
        switch endpoint {
        case .createAccount:
            self.setValue(HTTP.Headers.Value.applicationJson.rawValue, forHTTPHeaderField: HTTP.Headers.Key.contentType.rawValue)
        }
    }
}
