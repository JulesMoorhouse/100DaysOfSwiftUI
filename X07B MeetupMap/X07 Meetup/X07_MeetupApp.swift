//
//  X07_MeetupApp.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 27/04/2021.
//

import SwiftUI

@main
struct X07_MeetupApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
