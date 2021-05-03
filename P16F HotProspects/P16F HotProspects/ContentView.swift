//
//  ContentView.swift
//  P16F HotProspects
//
//  Created by Julian Moorhouse on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColour = Color.red

    var body: some View {
        VStack {
            Text("Hello, world!")
                .padding()
                .background(backgroundColour)
            
            Text("Change colour")
                .padding()
                .contextMenu {
                    Button(action: {
                        self.backgroundColour = .red
                    }) {
                        Text("Red")
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.red)
                    }
                    
                    Button(action: {
                        self.backgroundColour = .green
                    }) {
                        Text("Green")
                    }
                    
                    Button(action: {
                        self.backgroundColour = .blue
                    }) {
                        Text("Blue")
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
