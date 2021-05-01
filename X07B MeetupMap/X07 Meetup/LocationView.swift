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
    
    var body: some View {
        Section {
            MapView(currentLocation: $location, annotation: pin)
                .frame(maxWidth: .infinity, minHeight: 200, maxHeight: 200)
        }
        .onAppear() {
            let newLocation = MKPointAnnotation()
            newLocation.coordinate = self.location
            newLocation.title = "Contacts location"
            self.pin = newLocation
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        let coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)

        LocationView(location: .constant(coordinate))
    }
}
