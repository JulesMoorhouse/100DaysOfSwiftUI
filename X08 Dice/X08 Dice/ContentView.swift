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
    @State private var dice = Dice(sides: 4, numberOfDice: 4)
    @State private var changedDice = Dice(sides: 0, numberOfDice: 0)

    let possibleSides = [4, 6, 8, 10, 12, 20, 100]

    var body: some View {
        TabView {
            VStack {
                Form {
                    // Number of Sides
                    VStack(alignment: .leading) {
                        Text("Number of sides")
                        Picker("", selection: $dice.sides) {
                            ForEach(possibleSides, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }

                    VStack {
                        Stepper(value: $dice.numberOfDice, in: 1 ... 9, step: 1) {
                            HStack {
                                Text("Number of dice ")
                                Text("\(dice.numberOfDice)")
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

                            DiceView(dice: $changedDice)

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
        //dice.values = [5, 7, 3, 7, 1, 4, 5]
        changedDice = dice
        changedDice.values = [5, 7, 3, 7, 1, 4, 5]
        changedDice.isRotating.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
