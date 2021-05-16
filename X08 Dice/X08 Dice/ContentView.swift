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
    @State private var sleepAmount = 4

    let possibleSides = [4, 6, 8, 10, 12, 20, 100]

    @State private var isRotating = false

    var body: some View {
        TabView {
            VStack {
                Form {
                    // Number of Sides
                    VStack(alignment: .leading) {
                        Text("Number of sides")
                        Picker("", selection: $sides) {
                            ForEach(possibleSides, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    VStack {
                        Stepper(value: $sleepAmount, in: 1 ... 9, step: 1) {
                            HStack {
                                Text("Number of dice ")
                                Text("\(sleepAmount)")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    VStack {
                        Button("Rotate") {
                            self.values = [5, 7, 3, 7, 1, 4, 5]
                            self.isRotating.toggle()
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .padding(.top)

                        HStack {
                            Spacer()

                            DiceView(sides: self.$sides, values: self.$values, isRotating: $isRotating)

                            Spacer()
                        }
                    }
                }
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
