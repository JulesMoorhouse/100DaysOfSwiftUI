//
//  ContentView.swift
//  P02 Guess The Flag
//
//  Created by Julian Moorhouse on 14/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
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
        //        VStack(spacing: 20) {
        //            VStack {
        //                HStack {
        //                    Text("one")
        //                    Text("two")
        //                    Text("three")
        //                }
        //            }
        //            VStack {
        //                HStack {
        //                    Text("four")
        //                    Text("five")
        //                    Text("six")
        //                }
        //            }
        //            VStack {
        //                HStack {
        //                    Text("seven")
        //                    Text("eight")
        //                    Text("nine")
        //                }
        //            }
        //        }
        // ---
        // Colours
        // -------
        //        ZStack {
        //            //Color.red.frame(width: 200, height: 200)
        //            //Color(red: 1, green: 0.8, blue: 0)
        //            Color.red.edgesIgnoringSafeArea(.all)
        //            Text("Your content")
        //        }
        // Gradients
        // ---------
        //        LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
        // ---
        //                RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 20, endRadius: 200)
        // ---
        //        AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center)
        // ---
        // Buttons and Images
        // ------------------
        //        Button("Tap me!") {
        //            print("Button was tapped")
        //        }
        // ---
        //        Button(action: {
        //            print("Button was tapped")
        //        }) {
        //            //Text("Tap me!")
        //            //Image(systemName: "pencil")
        //            HStack(spacing: 10) {
        //                Image(systemName: "pencil")
        //                Text("Edit")
        //            }
        //        }
        // ---
        Button("Show Alert") {
            self.showingAlert = true
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Hello SwiftUI"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
