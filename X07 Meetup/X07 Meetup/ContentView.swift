//
//  ContentView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 27/04/2021.
//

import CoreData
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Contacts.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Contacts>

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(items) { item in
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    }
                    .onDelete(perform: deleteItems)
                }
            }
            .navigationBarTitle("Meetup")
            .navigationBarItems(leading: EditButton(), trailing:
                Button(action: addItem) {
                    Image(systemName: "plus")
                })
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Contacts(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func saveImage(imageFileName: String, image: UIImage) {
        do {
            let filename = getDocumentDirectory().appendingPathComponent(imageFileName)

            let jpegData = image.jpegData(compressionQuality: 0.8)

            try jpegData?.write(to: filename, options: [.atomicWrite, .completeFileProtection])

            print("Saved correctly")
        } catch {
            print("Unable to save data. \(error.localizedDescription)")
            print("\(error)")
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
