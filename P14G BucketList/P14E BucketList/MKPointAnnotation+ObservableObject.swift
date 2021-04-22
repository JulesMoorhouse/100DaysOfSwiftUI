//
//  MKPointAnnotation-ObservableObject.swift
//  P14E BucketList
//
//  Created by Julian Moorhouse on 22/04/2021.
//

import MapKit

extension MKPointAnnotation: ObservableObject {

    // no need for published as view doesn't need to be refreshed as the user type
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    // no need for published as view doesn't need to be refreshed as the user type
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
