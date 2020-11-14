//
//  ContentView.swift
//  P02 Guess The Flag
//
//  Created by Julian Moorhouse on 14/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // VStack / HStack / ZStack - examples
        // -----------------------------------
        //        VStack(alignment: .leading, spacing: 20) {
        //            Text("Hello, World!")
        //            Text("This is another text view")
        //        }
        // ---
        //        HStack(spacing: 20) {
        //            Text("Hello, World!")
        //            Text("This is another text view")
        //        }
        // ---
        //        VStack {
        //            Text("First")
        //            Text("Second")
        //            Text("Third")
        //            Spacer()
        //        }
        // ---
        //        ZStack {
        //            Text("Hello world")
        //            Text("This is a stack")
        //        }
        // ---
        // Practise
        //        ZStack {
        //            HStack {
        //                Text("One")
        //            }
        //            HStack {
        //                Text("Two")
        //                Text("Three")
        //            }
        //        }
        // ---
        // Practise grid
        VStack(spacing: 20) {
            VStack {
                HStack {
                    Text("one")
                    Text("two")
                    Text("three")
                }
            }
            VStack {
                HStack {
                    Text("four")
                    Text("five")
                    Text("six")
                }
            }
            VStack {
                HStack {
                    Text("seven")
                    Text("eight")
                    Text("nine")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
