//
//  ReservaViewModel.swift
//  MARCO
//
//  Created by Valeria Conde on 10/18/21.
//

import Foundation

import SwiftUI

class ReservaViewModel : ObservableObject {
    @Published var horariosDisponibles = [HorarioModel]()
    
    func reservarVisita(date: Date, horario: String, guia: String, personas: Int, usuario: String) {
        
        Webservice().reservarVisita(date: date, horario: horario, guia: guia, personas: personas, usuario: usuario) { result in
            
            switch (result) {
                case .success(let succ):
                print(succ)

                case .failure(let error):
                print(error)
            } // switch
        } // webservice
    } // func
    
    func getHorariosDisponibles(date: Date) {
        
        DispatchQueue.main.async {
            Webservice().getHorariosDisponibles(date: date) { result in
                switch (result) {
                    case .success(let succ):
                        print(succ)
                        self.horariosDisponibles = succ
                        
                    case .failure(let error):
                        print(error)
                } // switch
            } // webservice
        }
        
    } // func
    
} // class
