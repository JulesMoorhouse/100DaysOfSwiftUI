//
//  ContentView.swift
//  P18G LayoutAndGeometry
//
//  Created by Julian Moorhouse on 12/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            // With offset were changing the location where the view
            // should be rendered without changing it's underlying geometry.
            .offset(x: 100, y: 100)
            // So here the background is using the original position of the text
            .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
