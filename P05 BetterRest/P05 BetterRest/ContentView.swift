//
//  ContentView.swift
//  P05 BetterRest
//
//  Created by Julian Moorhouse on 03/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    @State private var sleepAmount = 8.0
//
//    var body: some View {
//        Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
//            Text("\(sleepAmount, specifier: "%g") hours")
//        }
//    }
// ---
    @State private var wakeUp = Date()
    
    var body: some View {
//        Form {
//            DatePicker("Please enter a date", selection: $wakeUp)
//        }
// ---
//        let now = Date()
//        let tomorrow = Date().addingTimeInterval(86400)
//        let range = now ... tomorrow
//
//        DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
//            .labelsHidden()
// ---
        // Allow all dates in the future
        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
