//
//  HTTP.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 19/09/23.
//

import Foundation

enum  HTTP {
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
    
    
    enum Headers {
        enum  Key: String {
            case contentType = "Content-Type"
        }
        
        enum  Value: String {
            case applicationJson = "application/json"

        }
    }
}
