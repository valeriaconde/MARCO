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
        
        Webservice().reservarVisita(usuario: usuario, guia: guia, date: date, horario: horario, personas: personas) { result in
            
            switch (result) {
                case .success(let succ):
                print(succ)

                case .failure(let error):
                print(error)
            } // switch
        } // webservice
    } // func
    
    
    func getHorariosDisponibles(date: Date, completion:@escaping ([HorarioModel]) -> ()) {
        //Los resultados se regresan en la misma función con completion
        
        DispatchQueue.main.async {
            Webservice().getHorariosDisponibles(date: date) { result in
                switch (result) {
                    case .success(let succ):
                        print(succ)
                        self.horariosDisponibles = succ
                        DispatchQueue.main.async {
                            completion(succ) //nos aseguramos de estar en el thread principal
                        }
                        
                    case .failure(let error):
                        print(error)
                } // switch
            } // webservice
        }
        
    } // func
    
} // class
