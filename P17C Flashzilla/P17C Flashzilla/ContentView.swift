//
//  ContentView.swift
//  P17C Flashzilla
//
//  Created by Julian Moorhouse on 06/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount: Angle = .degrees(0)
    @State private var finalAmount: Angle = .degrees(0)

    var body: some View {
        VStack {
            Text("Hello, World!")
                .onTapGesture {
                    // The child gesture is given priority
                    print("Text tapped")
                }
        }
//        .onTapGesture {
//            print("VStack tapped")
//        }
        // --
        // unless you use highPriorityGesture
        //.highPriorityGesture(
        // --
        // This will allow both to run
        .simultaneousGesture(
            TapGesture()
                .onEnded { _ in
                    print("VStack tapped")
                }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
