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

    @State private var showingImagePicker = false

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var image = Image(systemName: "questionmark.square.fill")
    @State private var inputImage: UIImage?
    @State private var photoFile = UUID()

    var body: some View {
        Form {
            Section(header: Text("").accessibility(hidden: true)) {
                ZStack(alignment: .bottomTrailing) {
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .frame(maxWidth: .infinity, maxHeight: 200)

                    Group {
                        Circle()
                            .fill(Color.secondary.opacity(0.3))
                            .frame(width: 40, height: 40)

                        Button(action: {
                            self.showingImagePicker = true
                        }) {
                            Image(systemName: "photo")
                                .frame(width: 40, height: 40)
                        }
                        .accessibility(hidden: true)
                    }
                    .accessibility(label: Text("Change photo"))
                }
            }
            Section(header: Text("").accessibility(hidden: true)) {
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
                self.firstName = self.contact.wrappedFirstName
                self.lastName = self.contact.wrappedLastName
                self.photoFile = self.contact.wrappedPhotoFile

                let imageSaver = ImageManager()
                image = imageSaver.loadImage(imageFileName: self.contact.photoFileString)
            }
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: {
            handleImage(photoFile: self.photoFile.uuidString)
        }) {
            ImagePicker(image: self.$inputImage)
        }
        .navigationBarTitle("\(firstName) \(lastName)")
        .navigationBarItems(trailing: Button(action: save) { Text("Save") }.accessibility(label: Text("Save contact changes")))
    }

    func save() {
        self.contact.firstName = self.firstName
        self.contact.lastName = self.lastName
        self.contact.timestamp = Date()
        self.contact.photoFile = self.photoFile

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
