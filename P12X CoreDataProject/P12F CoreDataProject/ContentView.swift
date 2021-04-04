//
//  ContentView.swift
//  P12F CoreDataProject
//
//  Created by Julian Moorhouse on 03/04/2021.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @State var lastNameFilter = "A"
    @State var sort: [NSSortDescriptor] = []
    @State var predicate = Predicate.beginsWith
    
    var body: some View {
        VStack {
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, sort: sort, predicate: predicate) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedFirstName)")
            }
            
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            Button("Show A") {
                self.lastNameFilter = "A"
            }
            
            Button("Show S") {
                self.lastNameFilter = "S"
            }

            Button("First name sort asc") {
                self.sort = [
                    NSSortDescriptor(keyPath: \Singer.firstName, ascending: true),
                    NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)
                ]
            }
            
            Button("last name sort desc") {
                self.sort = [
                    NSSortDescriptor(keyPath: \Singer.lastName, ascending: false),
                    NSSortDescriptor(keyPath: \Singer.firstName, ascending: true)
                ]
            }
            
            Button("Predicate - Begins With") {
                self.predicate  = .beginsWith
            }
            
            Button("Predicate - Less than") {
                self.predicate  = .lessThan
            }
            
            Spacer(minLength: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
