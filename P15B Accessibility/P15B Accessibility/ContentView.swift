//
//  ContentView.swift
//  P15B Accessibility
//
//  Created by Julian Moorhouse on 24/04/2021.
//

import SwiftUI

struct ContentView: View {
    //@State private var estimate = 25.0
    @State private var rating = 3
    
    var body: some View {
//        Slider(value: $estimate, in: 0...50)
//            .padding()
//            .accessibility(value: Text("\(Int(estimate))"))
        Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
            .accessibility(value: Text("\(rating) out of 5"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
