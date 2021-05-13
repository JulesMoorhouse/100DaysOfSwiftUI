//
//  ContentView.swift
//  P18H LayoutAndGeometry
//
//  Created by Julian Moorhouse on 13/05/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Text("Hello, World!")
                    .frame(width: geo.size.width * 0.9, height: 40)
                    .background(Color.red)
            }
            .background(Color.green)

            Text("More text")
               .background(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
