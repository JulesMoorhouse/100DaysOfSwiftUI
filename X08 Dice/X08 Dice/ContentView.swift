//
//  ContentView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 15/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var sides = 4
    @State private var values: [Int] = [4, 5, 6, 7]
        
    let possibleSides = [4, 6, 8, 10, 12, 20, 100]

    var body: some View {
        TabView {
            VStack {
                Form {
                    // Number of Sides
                    Section(header: Text("How much tip do you want to leave?")) {
                        Picker("Tip percentage", selection: $sides) {
                            ForEach(possibleSides, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // Number of dice
                }
                
                DiceView(sides: self.sides, values: self.values)
                
                // Total
                
                // Roll
                
                Spacer()
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
