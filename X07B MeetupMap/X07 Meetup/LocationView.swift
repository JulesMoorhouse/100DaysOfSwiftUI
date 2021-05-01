//
//  LocationView.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 01/05/2021.
//

import MapKit
import SwiftUI

struct LocationView: View {
    @Binding var location: CLLocationCoordinate2D
    @State private var pin = MKPointAnnotation()
    @State var locationFetcher: LocationFetcher

    var body: some View {
        Section(header: Text("Location")) {
            ZStack(alignment: .bottomTrailing) {
                MapView(currentLocation: $location, annotation: pin)
                    .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)

                CircleButtonView(imageName: "map")
                    .accessibility(label: Text("Change location"))
                    .padding(10)
                    .onTapGesture {
                        Reposition()
                    }
            }
        }
        .onAppear {
            let newLocation = MKPointAnnotation()
            newLocation.coordinate = self.location
            newLocation.title = "Contacts location"
            self.pin = newLocation
        }
    }

    func Reposition() {
        if let location = locationFetcher.lastKnownLocation {
            print("Your location is \(location)")
            self.location = location
            
            let newLocation = MKPointAnnotation()
            newLocation.coordinate = location
            newLocation.title = "Contacts location"
            self.pin = newLocation
        } else {
            print("Your location is unknown")
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)

        LocationView(location: .constant(coordinate), locationFetcher: LocationFetcher())
    }
}
