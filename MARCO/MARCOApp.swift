//
//  MARCOApp.swift
//  MARCO
//Aylin comment

import SwiftUI

@main
struct MARCOApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
