//
//  AddView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 29/04/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State private var firstName = ""
    @State private var lastName = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("First Name", text: $firstName)
                TextField("Last Name", text: $lastName)
            }
            .navigationBarTitle("Add new contact")
            .navigationBarItems(trailing:
                Button("Save") {
                    let item = Contact(context: self.moc)
                    item.firstName = self.firstName
                    item.lastName = self.lastName
                    item.timestamp = Date()

                    do {
                        try self.moc.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    
                    self.presentationMode.wrappedValue.dismiss()
                }
            )
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

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
