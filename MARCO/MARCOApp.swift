//
//  MARCOApp.swift
//  MARCO
//Aylin comment

import SwiftUI

@main
struct MARCOApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject var loginVM = LoginViewModel()
    
    var isLogged = false
    
    var body: some Scene {
        WindowGroup{
            if(loginVM.isLoggedIn) {
                HomeView()
                    //.environmentObject(media) ?? ? ?
                    .environmentObject(loginVM)
            } else {
            HomeDynamic()
                .environmentObject(loginVM)
            }
        }
    }
}
