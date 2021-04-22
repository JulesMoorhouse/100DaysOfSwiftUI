//
//  ContentView.swift
//  P14C BucketList
//
//  Created by Julian Moorhouse on 22/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
