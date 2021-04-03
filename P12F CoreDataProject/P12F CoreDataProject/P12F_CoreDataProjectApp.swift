//
//  P12F_CoreDataProjectApp.swift
//  P12F CoreDataProject
//
//  Created by Julian Moorhouse on 03/04/2021.
//

import SwiftUI

@main
struct P12F_CoreDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
