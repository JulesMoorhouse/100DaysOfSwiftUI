//
//  ContentView.swift
//  P01 WeSplit
//
//  Created by Julian Moorhouse on 08/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
//    var body: some View
//    {
//        NavigationView {
//            Form {
//                Section {
//                    Text("Hello, World!")
//                }
//            }
//            .navigationBarTitle("SwiftUI")
//        }
//    }
//---
//    @State private var tapCount = 0
//
//    var body: some View
//    {
//        Button("Tap Count \(tapCount)") {
//            self.tapCount += 1
//        }
//    }
//---
//    @State private var name = ""
//
//    var body: some View {
//        Form {
//            TextField("Enter your name", text: $name)
//            Text("Your name is \(name)")
//        }
//    }
//---
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectedStudent = "Harry"
    
    var body: some View {
        Picker("Select your student", selection: $selectedStudent) {
            ForEach(0 ..< students.count) {
                Text(self.students[$0])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider
{
    static var previews: some View
    {
        ContentView()
    }
}
