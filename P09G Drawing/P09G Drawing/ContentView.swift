//
//  ContentView.swift
//  P09G Drawing
//
//  Created by Julian Moorhouse on 05/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        ZStack {
//            Image("example")
//
//            Rectangle()
//                .fill(Color.red)
//                .blendMode(.multiply)
//        }
//        .frame(width: 400, height: 500)
//        .clipped()
        // --- or ---
        Image("example")
            .colorMultiply(.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
