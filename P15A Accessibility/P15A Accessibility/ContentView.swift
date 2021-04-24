//
//  ContentView.swift
//  P15A Accessibility
//
//  Created by Julian Moorhouse on 24/04/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
//        Image(decorative: "character")
//            .accessibility(hidden: true)
        VStack {
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
        //.accessibilityElement(children: .combine)
        .accessibility(label: Text("Your score is 1000"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
