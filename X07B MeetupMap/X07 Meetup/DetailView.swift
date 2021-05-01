//
//  DetailView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 29/04/2021.
//

import CoreData
import MapKit
import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State var contact: Contact

    @State private var showingImagePicker = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var photoFile = UUID()
    @State private var location = CLLocationCoordinate2D()
    @State var locationFetcher: LocationFetcher

    var body: some View {
        Form {
            PhotoView(image: self.$image, showingImagePicker: self.$showingImagePicker, photoFile: self.photoFile.uuidString)

            PersonalView(firstName: self.$firstName, lastName: self.$lastName)
                .onAppear {
                    // Should use wrapped
                    self.firstName = self.contact.wrappedFirstName
                    self.lastName = self.contact.wrappedLastName
                    self.photoFile = self.contact.wrappedPhotoFile
                    
                    let lat = self.contact.latitude?.doubleValue ?? 0
                    let lon = self.contact.longitude?.doubleValue ?? 0
                    self.location = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                    
                    let imageSaver = ImageManager()
                    image = imageSaver.loadImage(imageFileName: self.contact.photoFileString)
                }
            
            LocationView(location: $location, locationFetcher: locationFetcher)
        }
        .navigationBarTitle("\(firstName) \(lastName)")
        .navigationBarItems(trailing: Button(action: save) { Text("Save") }
            .accessibility(label: Text("Save contact changes")))
    }

    func save() {
        self.contact.firstName = self.firstName
        self.contact.lastName = self.lastName
        self.contact.timestamp = Date()
        self.contact.photoFile = self.photoFile
        self.contact.latitude = NSNumber(value: self.location.latitude)
        self.contact.longitude = NSNumber(value: self.location.longitude)

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
        let contact = Contact(context: moc)
        contact.firstName = "John"
        contact.lastName = "Smith"

        return NavigationView {
            DetailView(contact: contact, locationFetcher: LocationFetcher())
        }
    }
}
