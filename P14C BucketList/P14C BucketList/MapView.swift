//
//  MapView.swift
//  P14C BucketList
//
//  Created by Julian Moorhouse on 22/04/2021.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
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
