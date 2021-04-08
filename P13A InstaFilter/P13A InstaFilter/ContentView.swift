//
//  ContentView.swift
//  P13A InstaFilter
//
//  Created by Julian Moorhouse on 08/04/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showingActionSheet = false
    @State private var backgroundColor = Color.white
    
    var body: some View {
        Text("Hello, world!")
            .frame(width: 300, height: 300)
            .background(backgroundColor)
            .onTapGesture {
                self.showingActionSheet = true
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Change background"), message: Text("Select a new color"), buttons: [
                                .default(Text("Red")) {
                                    self.backgroundColor = Color.red
                                },
                                .default(Text("Blue")) {
                                    self.backgroundColor = Color.blue
                                },
                                .default(Text("Green")) {
                                    self.backgroundColor = Color.green
                                },
                    .cancel()
                ])
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
