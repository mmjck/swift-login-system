//
//  ServerResponse.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 19/09/23.
//

import Foundation


class SucessResponse: Decodable {
    let sucess: String
}


class ErrorResponse: Decodable {
    let error: String
}
