//
//  ReservaViewModel.swift
//  MARCO
//
//  Created by Valeria Conde on 10/18/21.
//

import Foundation

import SwiftUI

class ReservaViewModel : ObservableObject {
    func reservarVisita(date: Date, horario: String, guia: String, personas: Int, usuario: String) {
        
        Webservice().reservarVisita(date: date, horario: horario, guia: guia, personas: personas, usuario: usuario) { result in
            
            switch (result) {
                case .success(let succ):
                print(succ)

                case .failure(let error):
                print(error)
            } // switch
            
        }
    } // func
} // class
