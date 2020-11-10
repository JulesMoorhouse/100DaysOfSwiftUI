//
//  ContentView.swift
//  X01 Unit Conversion
//
//  Created by Julian Moorhouse on 10/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 0
    
    var inputMeters: Measurement<UnitLength> {
        let number: Double = Double(input) ?? 0
        switch unitTypes[inputUnit] {
            case "Meters":
                return Measurement(value: number, unit: UnitLength.meters)
                    .converted(to: .meters)
            case "Kilometers":
                return Measurement(value: number, unit: UnitLength.kilometers)
                    .converted(to: .meters)
            case "Feet":
                return Measurement(value: number, unit: UnitLength.feet)
                    .converted(to: .meters)
            case "Yards":
                return Measurement(value: number, unit: UnitLength.yards)
                    .converted(to: .meters)
            case "Miles":
                return Measurement(value: number, unit: UnitLength.miles)
                    .converted(to: .meters)
            default:
                return Measurement(value: 0, unit: UnitLength.meters)
                    .converted(to: .meters)
        }
    }

    var conversionOutput: Measurement<UnitLength> {
        switch unitTypes[outputUnit] {
            case "Meters":
                return inputMeters.converted(to: .meters)
            case "Kilometers":
                return inputMeters.converted(to: .kilometers)
            case "Feet":
                return inputMeters.converted(to: .feet)
            case "Yards":
                return inputMeters.converted(to: .yards)
            case "Miles":
                return inputMeters.converted(to: .miles)
            default:
                return inputMeters.converted(to: .meters)
        }
    }

    let unitTypes = ["Meters", "Kilometers", "Feet", "Yards", "Miles"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Input unit")) {
                    Picker("From ", selection: $inputUnit) {
                        ForEach(0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output unit")) {
                    Picker("To", selection: $outputUnit) {
                        ForEach(0 ..< unitTypes.count) {
                            Text("\(self.unitTypes[$0])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    TextField("Amount", text: $input)
                    .keyboardType(.decimalPad)
                }
                Section(header: Text("Conversion")) {
                    Text("\(conversionOutput.description)")
                }
            }
            .navigationBarTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
