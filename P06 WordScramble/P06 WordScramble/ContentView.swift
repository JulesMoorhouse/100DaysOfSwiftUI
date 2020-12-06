//
//  ContentView.swift
//  P06 WordScramble
//
//  Created by Julian Moorhouse on 06/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //    var body: some View {
    //        List {
    // ---
    //            Text("Hello, World!")
    //            Text("Hello, World!")
    //            Text("Hello, World!")
    // ---
    //            Section(header: Text("Section 1")) {
    //                Text("Static row 1")
    //                Text("Static row 2")
    //            }
    //            Section(header: Text("Section 2")) {
    //                ForEach(0..<5) {
    //                    Text("Dynamic row \($0)")
    //                }
    //            }
    //            Section(header: Text("Section 3")) {
    //                Text("Static row 3")
    //                Text("Static row 4")
    //            }
    //      }
    //      .listStyle(GroupedListStyle()) // or without for section headers
    // ---
    //        List(0..<5) {
    //            Text("Dynamic row \($0)")
    //        }
    //        .listStyle(GroupedListStyle()) // or without for section headers
    // }
    // ---
    let people = ["Finn", "Leia", "Luke", "Rey"]
    
    var body: some View {
        //        List(people, id: \.self) {
        //            Text($0)
        //        }
        //        .listStyle(GroupedListStyle())
        // which is the same as (but we can mix with static rows)
        List {
            ForEach(people, id: \.self) {
                Text($0)
            }
        }
        .listStyle(GroupedListStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
