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
    let correo : String
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

struct AddReservaRequestBody: Codable{
    let usuario: String
    let guia : String
    let fecha : Date
    let horario : String
    let personas : Int
}

struct AddReservaResponse: Codable{
    let message: String?
}

struct GetHorariosRequestBody: Codable {
    let date : Date
}

struct GuiasResponse : Codable {
    var guias : [String]
}

class Webservice{
    
    // LOGIN WEB SERVICES //
    
    func login(username: String, password: String, completion: @escaping (Result<String, AuthenticationError>) -> Void) {
        
        //100.24.228.237:10025
        guard let url = URL(string: "http://172.31.0.28:10025/users/login") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
    
        let body = LoginRequestBody(correo: username, password: password)
        
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
    
    
    // RESERVACIONES WEB SERVICES //
    
    func getHorariosDisponibles(date: Date, completion: @escaping (Result<[HorarioModel], CommunicationError>) -> Void) {
        
        // formatea la fecha para coincidir con la API
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter3.string(from: date)
        
        // endpoint
        print("http://172.31.0.28:10025/vguiadas/\(formattedDate)")
        guard let url = URL(string: "http://172.31.0.28:10025/vguiadas/\(formattedDate)") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let Response = try! JSONDecoder().decode(HorariosResponse.self, from: data!)
           
            DispatchQueue.main.async {
                completion(.success(Response.horarios))
            }
        }.resume()
        
    }
    
    func getGuiasDisponibles(date: Date, horario: String, completion: @escaping (Result<[String], CommunicationError>) -> Void) {
        
        // formatea la fecha para coincidir con la API
        let formatter3 = DateFormatter()
        formatter3.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter3.string(from: date)
        
        // endpoint
        guard let url = URL(string: "http://172.31.0.28:10025/vguiadas/getGuias/\(formattedDate)/\(horario)") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            let Response = try! JSONDecoder().decode(GuiasResponse.self, from: data!)
           
            DispatchQueue.main.async {
                completion(.success(Response.guias))
            }
        }.resume()
        
    }
    
    
    func reservarVisita(usuario: String, guia: String, date: Date, horario: String, personas: Int, completion: @escaping (Result<Bool, CommunicationError>) -> Void) {
        // formatea la fecha para coincidir con la API
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .formatted(formatter)
        
        // endpoint
        guard let url = URL(string: "http://172.31.0.28:10025/vguiadas/update/\(usuario)/\(guia)/\(date)/\(horario)/\(personas)") else {
            completion(.failure(.custom(errorMessage: "URL is not Correct")))
            return
        }
        
        let body = AddReservaRequestBody(usuario: usuario, guia: guia, fecha: date, horario : horario, personas: personas)
        
        print(body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? encoder.encode(body)  // con esta linea de código puedes enviar la fecha formateada
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
        guard let data = data, error == nil else {
            completion(.failure(.custom(errorMessage: "No data")))
            return
        }
        
        guard let AddReservaResponse = try? JSONDecoder().decode(AddReservaResponse.self, from: data) else {
            completion(.failure(.connectionError))
            return
        }
        
        completion(.success(true))
        
            
        }.resume()
        
    } // reservarVisita
}
