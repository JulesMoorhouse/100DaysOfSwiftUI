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

    @State var contact: Contact

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var image = Image(systemName: "questionmark.square.fill")
    @State private var inputImage: UIImage?

    var body: some View {
            Form {
                Section {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame( maxWidth: .infinity, maxHeight: 200)
                }
                    Section {
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
                // Should use wrapped
                self.firstName = self.contact.firstName ?? ""
                self.lastName = self.contact.lastName ?? ""

                let imageSaver = ImageManager()
                image = imageSaver.loadImage(imageFileName: self.contact.photoFile?.uuidString ?? "")
            }
        }
        .navigationBarTitle("\(firstName) \(lastName)")
        .navigationBarItems(trailing: Button(action: save) { Text("Save") })
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

    func handleImage(photoFile: String) {
        guard let inputImage = inputImage else { return }
        self.image = Image(uiImage: inputImage)

        let imageSaver = ImageManager()
        imageSaver.writeToFile(photoFile: photoFile, image: inputImage)
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let contact = Contact(context: moc)
        contact.firstName = "John"
        contact.lastName = "Smith"

        return NavigationView {
            DetailView(contact: contact)
        }
    }
}
