//
//  MARCOApp.swift
//  MARCO
//Aylin comment

import SwiftUI

@main
struct MARCOApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var loginVM = LoginViewModel()
    @StateObject var reservaVM = ReservaViewModel()
    
    var isLogged = false
    
    var body: some Scene {
        WindowGroup{
            if(loginVM.isLoggedIn) {
                HomeDynamic()
                    .environmentObject(loginVM)
                    .environmentObject(reservaVM)
            } else {
                HomeDynamic()
                .environmentObject(loginVM)
                .environmentObject(reservaVM)
            }
        }
    }
}
