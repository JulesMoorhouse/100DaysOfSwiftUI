//
//  ContentView.swift
//  P18A LayoutAndGeometry
//
//  Created by Julian Moorhouse on 11/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .bottom) {
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
