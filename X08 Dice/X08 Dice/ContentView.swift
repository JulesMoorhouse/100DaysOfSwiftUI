//
//  ContentView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 15/05/2021.
//

import SwiftUI

struct DiceItem {
    var sides: Int
    var values: [Int] = []
    var numberOfDice: Int
    var isRotating: Bool = false
}

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc

    @State private var dice = DiceItem(sides: 0, numberOfDice: 0)
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
            DiceListView()
                
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
        
        dice = DiceItem(sides: sides,
                           values: ints,
                           numberOfDice: numberOfDice,
                           isRotating: true)
        
        let stringArray = ints.map { String($0) }
        
        let temp = Dice(context: self.moc)
        temp.sides = Int16(sides)
        temp.number = Int16(numberOfDice)
        temp.values = stringArray.joined(separator: ",")
        
        try? self.moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
