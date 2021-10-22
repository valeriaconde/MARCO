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
        
        expo = Expo(name: "INDEX", description: "una obra de arte", images: ["index1", "index2", "index4", "index3"])
        expos.append(expo);
        
        
    }
}
