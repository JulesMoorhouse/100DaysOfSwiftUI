//
//  MapView.swift
//  P14C BucketList
//
//  Created by Julian Moorhouse on 22/04/2021.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    // Coordinator is a delegate of the MapView
    // So when something happens with the map, it gets notified
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            print(mapView.centerCoordinate)
        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: nil)
            view.canShowCallout = true
            
            return view
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let annontation = MKPointAnnotation()
        annontation.title = "London"
        annontation.subtitle = "Capital of England"
        annontation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: 0.13)
        mapView.addAnnotation(annontation)
        
        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
