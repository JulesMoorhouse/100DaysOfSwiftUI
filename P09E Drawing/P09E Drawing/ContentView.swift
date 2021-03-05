//
//  ContentView.swift
//  P09E Drawing
//
//  Created by Julian Moorhouse on 05/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Capsule()
            .strokeBorder(ImagePaint(image: Image("example"), scale: 0.1), lineWidth: 20)
            .frame(width: 300, height: 200)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
