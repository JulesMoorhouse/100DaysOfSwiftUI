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
            NSSortDescriptor(keyPath: \Contacts.lastName, ascending: true),
            NSSortDescriptor(keyPath: \Contacts.firstName, ascending: true)
        ],
        animation: .default)
     var items: FetchedResults<Contacts>

    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.items, id: \.self) { item in
                        NavigationLink(destination:
                                        DetailView(contact: item)
                                        .environment(\.managedObjectContext, self.moc)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(item.firstName!)
                                    Text(item.lastName!)
                                }
                                Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                            }
                        }
                    }
                    .onDelete(perform: deleteItems)
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
            offsets.map { items[$0] }.forEach(moc.delete)

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
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
