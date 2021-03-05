//
//  ContentView.swift
//  P09D Drawing
//
//  Created by Julian Moorhouse on 05/03/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .frame(width: 300, height: 300)
            //.border(ImagePaint(image: Image("example"), scale: 0.2), width: 30)
            .border(ImagePaint(image: Image("example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5) , scale: 0.1), width: 30)
        

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
