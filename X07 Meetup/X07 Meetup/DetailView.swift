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

    @State var  contact: Contacts
    
    var body: some View {
        Form {
            Section {
                TextField("", text: .constant(self.contact.firstName ?? ""))
                Text(self.contact.firstName ?? "")
            }
            Section {
                TextField("", text: .constant(self.contact.lastName ?? ""))
                Text(self.contact.lastName ?? "")
            }
        }
        .navigationBarTitle("Contact Details", displayMode: .inline)

        Spacer()
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
