//
//  ContentView.swift
//  P17B Flashzilla
//
//  Created by Julian Moorhouse on 06/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount: Angle = .degrees(0)
    @State private var finalAmount: Angle = .degrees(0)
    
    var body: some View {
        Text("Hello, world!")
            .rotationEffect(finalAmount + currentAmount)
            .gesture(
                RotationGesture()
                    .onChanged { angle in
                        self.currentAmount = angle
                    }
                    .onEnded { angle in
                        self.finalAmount += self.currentAmount
                        self.currentAmount = .degrees(0)
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
