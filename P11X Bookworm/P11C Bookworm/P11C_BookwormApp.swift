//
//  P11C_BookwormApp.swift
//  P11C Bookworm
//
//  Created by Julian Moorhouse on 01/04/2021.
//

import SwiftUI

@main
struct P11C_BookwormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
