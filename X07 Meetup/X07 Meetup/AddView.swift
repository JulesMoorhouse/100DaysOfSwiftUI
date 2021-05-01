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
    @State private var inputImage: UIImage?
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var photoFile = UUID()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("").accessibility(hidden: true)) {
                    ZStack {
                        Rectangle()
                            .fill(Color.secondary.opacity(0.3))
                            .frame(maxHeight: 200)
                            .clipShape(Circle())
                            .padding(10)

                        if image != nil {
                            image?
                                .resizable()
                                .scaledToFit()
                                .clipShape(Circle())
                                .frame(maxWidth: .infinity, maxHeight: 200)

                        } else {
                            Text("Tap to select a photo")
                                .frame(maxWidth: 150, maxHeight: 150)
                                .lineLimit(3)
                                .foregroundColor(.white)
                                .font(.headline)
                                .multilineTextAlignment(.center)
                        }
                    }
                    .onTapGesture {
                        self.showingImagePicker = true
                    }
                    .frame(maxWidth: .infinity, minHeight: 200)
                }

                Section(header: Text("").accessibility(hidden: true)) {
                    VStack(alignment: .leading, spacing: 0) {
                        TextField("First Name", text: $firstName)
                    }

                    VStack(alignment: .leading, spacing: 0) {
                        TextField("Last Name", text: $lastName)
                    }
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: {
                handleImage(photoFile: self.photoFile.uuidString)
            }) {
                ImagePicker(image: self.$inputImage)
            }
            .navigationBarTitle("New contact")
            .navigationBarItems(leading:
                Button("Cancel")
                     {
                        self.presentationMode.wrappedValue.dismiss()
                    }.accessibility(label: Text("Cancel and leave screen")),
                trailing:
                Button("Save")
                     {
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

    func handleImage(photoFile: String) {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)

        let imageSaver = ImageManager()
        imageSaver.writeToFile(photoFile: photoFile, image: inputImage)
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
