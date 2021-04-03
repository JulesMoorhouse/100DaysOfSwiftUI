//
//  P12C_CoreDataProjectApp.swift
//  P12C CoreDataProject
//
//  Created by Julian Moorhouse on 03/04/2021.
//

import SwiftUI

@main
struct P12C_CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
