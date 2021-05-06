//
//  ContentView.swift
//  P17 Flashzilla
//
//  Created by Julian Moorhouse on 06/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var currentAmount: CGFloat = 0
    @State private var finalAmount: CGFloat = 1
    
    var body: some View {
        Text("Hello, world!")
//            .onTapGesture(count: 2) {
//                print("Double tapped!")
//            }
//--
//            .onLongPressGesture {
//                print("Long pressed!")
//            }
//--
//            .onLongPressGesture(minimumDuration: 2) {
//                print("Long pressed!")
//            }
//--
//            .onLongPressGesture(minimumDuration: 2, pressing: { inProgress in
//                print("In progress: \(inProgress)")
//            }) {
//                print("Long pressed!")
//            }
//--
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnificationGesture()
                    .onChanged { amount in
                        self.currentAmount = amount - 1
                    }
                    .onEnded { amount in
                        self.finalAmount += self.currentAmount
                        self.currentAmount = 0
                    }
            )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
