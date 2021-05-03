//
//  ContentView.swift
//  P16E HotProspects
//
//  Created by Julian Moorhouse on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // This is a small picture
        Image("example")
            .interpolation(.none) // now pixelated / looks like line art
            .resizable()
            .scaledToFit()
            .frame(maxHeight: .infinity)
            .background(Color.black)
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
