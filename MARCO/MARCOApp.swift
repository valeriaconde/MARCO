//
//  MARCOApp.swift
//  MARCO
//Aylin comment

import SwiftUI

@main
struct MARCOApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup{
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
