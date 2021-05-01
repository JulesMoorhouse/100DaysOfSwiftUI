//
//  AddView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 29/04/2021.
//

import CoreData
import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State private var showingImagePicker = false

    @State private var image: Image?
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var photoFile = UUID()

    var body: some View {
        Form {
            PhotoView(image: self.$image, showingImagePicker: self.$showingImagePicker, photoFile: self.photoFile.uuidString)

            Section(header: Text("").accessibility(hidden: true)) {
                VStack(alignment: .leading, spacing: 0) {
                    TextField("First Name", text: $firstName)
                }

                VStack(alignment: .leading, spacing: 0) {
                    TextField("Last Name", text: $lastName)
                }
            }
        }
        .navigationBarTitle("New contact")
        .navigationBarItems(trailing:
            Button("Save") {
                let item = Contact(context: self.moc)
                item.firstName = self.firstName
                item.lastName = self.lastName
                item.timestamp = Date()

                if image != nil {
                    item.photoFile = photoFile
                }

                do {
                    try self.moc.save()
                } catch {
                    // Replace this implementation with code to handle the error appropriately.
                    // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }

                self.presentationMode.wrappedValue.dismiss()
            }.accessibility(label: Text("Save new contact")))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
