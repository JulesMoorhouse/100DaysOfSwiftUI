//
//  DetailView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 29/04/2021.
//

import CoreData
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State var contact: Contacts

    @State private var firstName = ""
    @State private var lastName = ""

    var body: some View {
        Form {
            VStack(alignment: .leading, spacing: 0) {
                Text("First name")
                    .font(.headline)
                TextField("", text: $firstName)
                    .foregroundColor(.secondary)
            }

            VStack(alignment: .leading, spacing: 0) {
                Text("Last name")
                    .font(.headline)
                TextField("", text: $lastName)
                    .foregroundColor(.secondary)
            }
        }
        .onAppear {
            //Should use wrapped
            self.firstName = self.contact.firstName ?? ""
            self.lastName = self.contact.lastName ?? ""
        }
        .navigationBarTitle("Contact Details", displayMode: .inline)
        .navigationBarItems(trailing: Button(action: save) { Text("Save") })

        Spacer()
    }

    func save() {
        self.contact.firstName = self.firstName
        self.contact.lastName = self.lastName
        self.contact.timestamp = Date()
                
        do {
            if self.moc.hasChanges {
                try self.moc.save()
            }
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }

        self.presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let contact = Contacts(context: moc)
        contact.firstName = "John"
        contact.lastName = "Smith"

        return NavigationView {
            DetailView(contact: contact)
        }
    }
}
