//
//  ContentView.swift
//  P08B Moonshoot
//
//  Created by Julian Moorhouse on 17/02/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
//            VStack {
//                NavigationLink(destination: Text("Detail View")) {
//                    Text("Hello World")
//                }
//            }
            List(0..<100) { row in
                NavigationLink(destination: Text("Detail \(row)")) {
                    Text("Row \(row)")
                }
            }
            .navigationBarTitle("SwiftUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
