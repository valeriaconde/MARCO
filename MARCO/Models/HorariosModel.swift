//
//  HorariosModel.swift
//  MARCO
//
//  Created by Valeria Conde on 10/19/21.
//

import Foundation

struct HorariosResponse : Codable {
    var horarios : [HorarioModel]
}

struct HorarioModel : Identifiable, Codable {
    var id : String
    var hora : String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case hora
    }
}

