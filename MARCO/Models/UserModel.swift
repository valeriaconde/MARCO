//
//  UserModel.swift
//  MARCO
//
//  Created by Valeria Conde on 10/10/21.
//

import Foundation

struct UserResponse : Codable {
    var users: [UserModel]
}

struct UserModel : Codable, Identifiable {
    var id : String
    var username : String
    var password : String
    var usertype: [String]
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username = "correo"
        case password = "password"
        case usertype = "usertype"
    }
}
