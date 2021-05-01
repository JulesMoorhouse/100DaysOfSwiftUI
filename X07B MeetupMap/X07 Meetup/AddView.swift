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
    @State var locationFetcher: LocationFetcher

    var body: some View {
        Form {
            PhotoView(image: self.$image, showingImagePicker: self.$showingImagePicker, photoFile: self.photoFile.uuidString)

            PersonalView(firstName: self.$firstName, lastName: self.$lastName)

            LocationView(location: $currentLocation, locationFetcher: locationFetcher)
        }
        .navigationBarTitle("New contact")
        .navigationBarItems(trailing: Button(action: save) { Text("Save") }
            .accessibility(label: Text("Save new changes")))
        .onAppear {
            if let location = self.locationFetcher.lastKnownLocation {
                print("Your location is \(location)")
                self.currentLocation = location
            } else {
                print("Your location is unknown")
            }
        }
    }

    func save() {
        let item = Contact(context: self.moc)
        item.firstName = self.firstName
        item.lastName = self.lastName
        item.timestamp = Date()
        item.latitude = NSNumber(value: self.currentLocation.latitude)
        item.longitude = NSNumber(value: self.currentLocation.longitude)

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
