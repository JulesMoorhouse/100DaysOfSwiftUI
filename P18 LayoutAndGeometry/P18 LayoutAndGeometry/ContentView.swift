//
//  ContentView.swift
//  P18 LayoutAndGeometry
//
//  Created by Julian Moorhouse on 11/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Live long and prosper")
            .frame(width: 300, height: 300, alignment: .topLeading)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
