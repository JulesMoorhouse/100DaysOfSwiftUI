//
//  ContentView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 27/04/2021.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc

    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Contact.lastName, ascending: true),
            NSSortDescriptor(keyPath: \Contact.firstName, ascending: true)
        ],
        animation: .default)
    var contacts: FetchedResults<Contact>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            VStack {
                if self.contacts.count == 0 {
                    Text("Please add some contacts")
                        .foregroundColor(.secondary)
                } else {
                    List {
                        ForEach(self.contacts, id: \.self) { item in
                            NavigationLink(destination:
                                DetailView(contact: item)
                                    .environment(\.managedObjectContext, self.moc)) {
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Text(item.wrappedFirstName)
                                            Text(item.wrappedLastName)
                                        }
                                        Text("Added \(item.timestamp!, formatter: itemFormatter)")
                                            .font(.caption)
                                            .foregroundColor(.secondary)
                                    }
                            }
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
            }
            .navigationBarTitle("Meetup")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: {
                    self.showingAddScreen.toggle()
                }) {
                        Image(systemName: "plus")
                })
            .sheet(isPresented: $showingAddScreen) {
                AddView()
                    .environment(\.managedObjectContext, self.moc)
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            // Should also delete images
            offsets.map { contacts[$0] }.forEach(moc.delete)

            do {
                try moc.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .short
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
