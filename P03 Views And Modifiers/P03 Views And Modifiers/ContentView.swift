//
//  ContentView.swift
//  P03 Views And Modifiers
//
//  Created by Julian Moorhouse on 17/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    //let motto1 = Text("Draco dormiens")
    var motto1: some View { Text("Draco dormiens") }
    let motto2 = Text("nunquam titillandus")
    var body: some View {
        //        Text("Hello, World!")
        //            .frame(maxWidth: .infinity, maxHeight: .infinity)
        //            .background(Color.red)
        //            .edgesIgnoringSafeArea(.all)
        // ---
        // Modifier order matters, the red background isn't width / height 200
        // ----------------------
        //        Button("Hello World") {
        //            print(type(of: self.body))
        //        }
        //        .background(Color.red)
        //        .frame(width: 200, height: 200)
        // ---
        //        Text("Hello, World!")
        //            .padding()
        //            .background(Color.red)
        //            .padding()
        //            .background(Color.blue)
        //            .padding()
        //            .background(Color.green)
        //            .padding()
        //            .background(Color.yellow)
        // ---
        // Conditional modifiers
        // ---------------------
        //        Button("Hello World") {
        //            self.useRedText.toggle()
        //        }
        //        .foregroundColor(useRedText ? .red : .blue)
        // ---
        // Environment Modifiers
        // ---------------------
        //        VStack {
        //            Text("Gryffindor")
        //                .font(.largeTitle)
        //                .blur(radius: 0)
        //            Text("Hufflepuff")
        //            Text("Ravenclaw")
        //            Text("Slytherin")
        //        }
        //        .font(.title) // Enviroment modifier
        //        .blur(radius: 5) // regular modifier
        // ---
        // Views as properties
        // -------------------
        VStack {
            motto1
                .foregroundColor(.red)
            motto2
                .foregroundColor(.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
