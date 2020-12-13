//
//  ContentView.swift
//  P04 BetterRest
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
    //    @State private var wakeUp = Date()
    //
    //    var body: some View {
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
    //        // Allow all dates in the future
    //        DatePicker("Please enter a date", selection: $wakeUp, in: Date()...)
    //            .labelsHidden()
    // ---
    @State private var wakeUp = Date()
    
    var body: some View {
//        var components = DateComponents()
//        components.hour = 8
//        components.minute = 0
//
//        let date = Calendar.current.date(from: components) ?? Date()
//---
//        let components = Calendar.current.date(from: [.hour, .minute], from: someDate)
//        let hour = components.hour ?? 0
//        let minute = components.minute ?? 0
        // ---
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let dateString = formatter.string(from: Date())
        
        return DatePicker("Please enter a date", selection: $wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
