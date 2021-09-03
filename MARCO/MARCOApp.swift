//
//  MARCOApp.swift
//  MARCO
//
//  Created by Valeria Conde on 9/3/21.
//

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
