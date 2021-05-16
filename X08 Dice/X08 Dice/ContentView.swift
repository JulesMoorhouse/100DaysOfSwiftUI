//
//  ContentView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 15/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sides: UInt = 4
    @State private var values: [Int] = [4, 5, 6, 7]
        
    var body: some View {
        TabView {
            VStack {
                DiceView(sides: self.sides, values: self.values)
            }
            .tabItem {
                Image(systemName: "star")
                Text("One")
            }
            Text("Tab 2")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Two")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
