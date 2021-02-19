//
//  ContentView.swift
//  P08 Moonshot
//
//  Created by Julian Moorhouse on 13/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Image("example")
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 300, height: 300)
//                .clipped()
            
            GeometryReader { geo in
                Image("example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geo.size.width)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
