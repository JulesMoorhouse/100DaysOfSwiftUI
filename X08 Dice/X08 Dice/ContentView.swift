//
//  ContentView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 15/05/2021.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc

    @State private var dice = DiceItem(sides: 0, numberOfDice: 0)
    @State private var sides: Int = 4
    @State private var numberOfDice: Int = 5
    @State private var isRotating: Bool = false
    @State private var engine: CHHapticEngine?

    
    let possibleSides = [4, 6, 8, 10, 12, 20, 100]

    var body: some View {
        TabView {
            NavigationView {
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

                                DiceView(dice: $dice, isRotating: $isRotating)

                                Spacer()
                            }
                        }
                    }
                }
                .navigationBarTitle(Text("Dice"), displayMode: .inline)
            }
            .onAppear(perform: prepareHaptics)
            .tabItem {
                Image(systemName: "circle.fill.square.fill")
                Text("Dice")
            }
            NavigationView {
                DiceListView()
                    .navigationBarTitle(Text("History"), displayMode: .inline)
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("History")
            }
        }
    }

    func spin() {
        var ints: [Int] = []
        for _ in 0 ..< numberOfDice {
            let randomInt = Int.random(in: 1 ... sides)
            ints.append(randomInt)
        }

        dice = DiceItem(sides: sides,
                        values: ints,
                        numberOfDice: numberOfDice)

        let stringArray = ints.map { String($0) }

        let temp = Dice(context: moc)
        temp.sides = Int16(sides)
        temp.number = Int16(numberOfDice)
        temp.values = stringArray.joined(separator: ",")

        try? moc.save()

        isRotating.toggle()
        complexSuccess()
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        do {
            self.engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("There was an error creating the engine: \(error.localizedDescription)")
        }
    }

    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            
            events.append(event)
        }
        
        for i in stride(from: 0, to: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("Failed to play pattern: \(error.localizedDescription).")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
