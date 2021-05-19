//
//  ContentView.swift
//  P19B SnowSeeker
//
//  Created by Julian Moorhouse on 19/05/2021.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna, Arya and Toby")
        }
    }
}

struct ContentView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        Group {
            if sizeClass == .compact {
//                VStack {
//                    UserView()
//                }
                VStack(content: UserView.init)
            } else {
//                HStack {
//                    UserView()
//                }
                HStack(content: UserView.init)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
