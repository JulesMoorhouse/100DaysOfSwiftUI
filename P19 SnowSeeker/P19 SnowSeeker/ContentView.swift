//
//  ContentView.swift
//  P19 SnowSeeker
//
//  Created by Julian Moorhouse on 19/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: Text("New secondary")) {
                Text("Hello, world!")
            }
            .navigationBarTitle("Primary")

            Text("Secondary")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
