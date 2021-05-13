//
//  ContentView.swift
//  P18I LayoutAndGeometry
//
//  Created by Julian Moorhouse on 13/05/2021.
//

// Use an iPhone Pro Max 13.5 - to match Pauls settings

// see https://www.hackingwithswift.com/books/ios-swiftui/understanding-frames-and-coordinates-inside-geometryreader
// for explanation

// Want to know where this view is on the screen? Use the global space.
// Want to know where this view is relative to its parent? Use the local space.
// What to know where this view is relative to some other view? Use a custom space.

import SwiftUI

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}

struct ContentView: View {
    var body: some View {
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
