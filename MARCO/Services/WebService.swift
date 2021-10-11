//
//  WebServices.swift
//  MARCO
//
//  Created by Valeria Conde on 10/7/21.
//

import Foundation

enum AuthenticationError: Error{
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginRequestBody: Codable{
    let username : String
    let password: String
}

struct LoginResponse: Codable{
    let token: String?
    let message: String?
    let success: Bool?
}

enum CommunicationError: Error {
    case connectionError
    case custom(errorMessage: String)
    
}

struct AddUserRequestBody: Codable {
    let username: String
    let password: String
    let usertype: String
}


struct AddUserResponse: Codable{
    let message: String?
    let success: Bool?
}

class Webservice{
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3005/login") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
    
        let body = LoginRequestBody(username: username, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            guard let token = loginResponse.token else {
                completion(.failure(.invalidCredentials))
                return
            }
            
            completion(.success(token))
            
            
        }.resume()
    }
    
    func signUp(username: String, password: String, completion: @escaping (Result<Bool, CommunicationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3005/users/addUser") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
    
        let body = AddUserRequestBody(username: username, password: password, usertype: "usuario")
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.custom(errorMessage: "No data")))
                return
            }
            
            guard let AddUserResponse = try? JSONDecoder().decode(AddUserResponse.self, from: data) else {
                completion(.failure(.connectionError))
                return
            }
            
            guard let token = AddUserResponse.success else {
                completion(.failure(.connectionError))
                return
            }
            
            completion(.success(token))
            
            
        }.resume()
    }
    
    func getUsers(completion: @escaping (Result<UserResponse, CommunicationError>) -> Void) {
        
        guard let url = URL(string: "http://localhost:3005/users") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
    
        URLSession.shared.dataTask(with: url) { data, response, error in
            print(data!.count)
            let usersResponse = try! JSONDecoder().decode(UserResponse.self, from: data!)
            print(usersResponse)
            DispatchQueue.main.async {
                completion(.success(usersResponse))
            }
            
        }.resume()
    }
    
}
