//
//  ContentView.swift
//  P09 Drawing
//
//  Created by Julian Moorhouse on 20/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Path { path in
//            path.move(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300))
//            path.addLine(to: CGPoint(x: 300, y: 300))
//            path.addLine(to: CGPoint(x: 200, y: 100))
//            path.addLine(to: CGPoint(x: 100, y: 300)) // draw first line agin to fix point issue
//        }
//        //.fill(Color.blue)
//        //.stroke(Color.blue, lineWidth: 10)
//        .stroke(Color.blue.opacity(0.25), lineWidth: 10)
        //---
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
