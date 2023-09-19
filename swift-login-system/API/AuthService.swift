//
//  AuthService.swift
//  swift-login-system
//
//  Created by Jackson Matheus on 19/09/23.
//

import Foundation

enum ServiceError: Error {
    case serverError(String)
    case unknow(String = "An unknow error occured.")
    case decodingError(String = "Error parsing server response")
}

class AuthService {
    static func createAccount(request: URLRequest, completion: @escaping
                              (Result<String, Error>) -> Void){
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard let data = data else  {
                if let error = error  {
                    completion(.failure(ServiceError.serverError(error.localizedDescription)))
                } else {
                    completion(.failure(ServiceError.unknow()))
                }
                
                return
                
            }
            let decoder = JSONDecoder()
            
            if let sucessMessage = try? decoder.decode(SucessResponse.self, from: data) {
                completion(.success(sucessMessage.sucess))
                return

            } else if let errorMessage = try?
                        decoder.decode(ErrorResponse.self, from: data) {
                print("error")
                completion(.failure(ServiceError.decodingError(errorMessage.error )))
                return
            } else {
                print("error 2")
                completion(.failure(ServiceError.decodingError()))
                return
            }
            
        }
    }
}
