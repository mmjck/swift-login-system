//
//  RegisterUserRequest.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 19/09/23.
//

import Foundation

struct RegisterUserRequest: Codable {
    let email: String
    let username: String
    let password: String
}
