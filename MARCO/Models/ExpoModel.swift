//
//  ExpoModel.swift
//  MARCO
//
//  Created by Valeria Conde on 9/9/21.
//

import SwiftUI

struct Expo : Identifiable {
    
    var id = UUID()
    var name : String
    var description : String
    var images : [String]
}

class ExpoModel: ObservableObject {
    
    @Published var expos = [Expo]()
    
    init() {
        LoadInfo()
    }
    
    func LoadInfo() {
        var expo : Expo
        
        expo = Expo(name: "La poética del regreso", description: "una obra de arte", images: ["post1", "post3", "post4", "post2"])
        expos.append(expo);
        
        
    }
}
