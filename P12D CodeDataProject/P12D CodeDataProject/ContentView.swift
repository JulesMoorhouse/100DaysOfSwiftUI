//
//  ContentView.swift
//  P12D CodeDataProject
//
//  Created by Julian Moorhouse on 03/04/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Wizard.entity(), sortDescriptors: []) var wizards: FetchedResults<Wizard>
    
    var body: some View {
        List(wizards, id: \.self) { wizard in
            Text(wizard.name ?? "Unknown")
        }
        
        Button("Add") {
            let wizard = Wizard(context: self.moc)
            wizard.name = "Harry Potter"
            wizard.timestamp = Date()
        }
        
        Button("Save") {
            do {
                try moc.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
