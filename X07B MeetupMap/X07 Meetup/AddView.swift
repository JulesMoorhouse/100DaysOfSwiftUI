//
//  AddView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 29/04/2021.
//

import CoreData
import MapKit
import SwiftUI

struct AddView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State private var showingImagePicker = false
    @State private var image: Image?
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var photoFile = UUID()
    @State private var currentLocation = CLLocationCoordinate2D()
    @State private var location = CodableMKPointAnnotation()
    @State private var selectedPlace: MKPointAnnotation?
    @State var locationFetcher: LocationFetcher

    var body: some View {
        Form {
            PhotoView(image: self.$image, showingImagePicker: self.$showingImagePicker, photoFile: self.photoFile.uuidString)

            PersonalView(firstName: self.$firstName, lastName: self.$lastName)

            Section {
                MapView(selectedPlace: $selectedPlace, currentLocation: $currentLocation, annotation: location)
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
            }
        }
        .navigationBarTitle("New contact")
        .navigationBarItems(trailing: Button(action: save) { Text("Save") }
            .accessibility(label: Text("Save new changes")))
        .onAppear {
            let newLocation = CodableMKPointAnnotation()
            if let location = self.locationFetcher.lastKnownLocation {
                print("Your location is \(location)")

                newLocation.coordinate = location
                newLocation.title = "Contacts location"
                self.currentLocation = location
                self.selectedPlace = newLocation
            } else {
                print("Your location is unknown")
            }

            self.location = newLocation
        }
    }

    func save() {
        let item = Contact(context: self.moc)
        item.firstName = self.firstName
        item.lastName = self.lastName
        item.timestamp = Date()

        if self.image != nil {
            item.photoFile = self.photoFile
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
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(locationFetcher: LocationFetcher())
    }
}
