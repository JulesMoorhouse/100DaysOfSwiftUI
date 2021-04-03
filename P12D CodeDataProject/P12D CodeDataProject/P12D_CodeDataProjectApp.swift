//
//  P12D_CodeDataProjectApp.swift
//  P12D CodeDataProject
//
//  Created by Julian Moorhouse on 03/04/2021.
//

import SwiftUI

@main
struct P12D_CodeDataProjectApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
