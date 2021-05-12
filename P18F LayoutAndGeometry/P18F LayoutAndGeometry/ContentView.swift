//
//  ContentView.swift
//  P18F LayoutAndGeometry
//
//  Created by Julian Moorhouse on 12/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .background(Color.blue)
            // Absolute positioned, this is also a new view which occupies all the space
            .position(x: 100, y: 100)
            .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
