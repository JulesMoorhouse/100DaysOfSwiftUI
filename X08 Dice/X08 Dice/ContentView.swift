//
//  ContentView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 15/05/2021.
//

import SwiftUI

struct Dice {
    var sides: Int
    var values: [Int] = []
    var numberOfDice: Int
    var isRotating: Bool = false
}

struct ContentView: View {
    @State private var dice = Dice(sides: 0, numberOfDice: 0)

    @State private var sides: Int = 4
    @State private var numberOfDice: Int = 5

    let possibleSides = [4, 6, 8, 10, 12, 20, 100]

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
                        Stepper(value: $numberOfDice, in: 1 ... 9, step: 1) {
                            HStack {
                                Text("Number of dice ")
                                Text("\(numberOfDice)")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }

                    HStack(alignment: .center) {
                        Spacer()
                        Button("Spin") {
                            withAnimation {
                                self.spin()
                            }
                        }
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .clipShape(Capsule())
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Spacer()

                            DiceView(dice: $dice)

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

    func spin() {
        var ints: [Int] = []
        for _ in 0..<numberOfDice {
            let randomInt = Int.random(in: 1...sides)
            ints.append(randomInt)
        }
        dice = Dice(sides: sides,
                           values: ints,
                           numberOfDice: numberOfDice,
                           isRotating: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
