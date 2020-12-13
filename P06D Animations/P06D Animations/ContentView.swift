//
//  ContentView.swift
//  P06D Animations
//
//  Created by Julian Moorhouse on 12/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap me") {
            self.enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.blue : Color.red)
        //.animation(.default)
        .animation(nil)
        .foregroundColor(.white)
        // Ordering matters
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        //.animation(.default)
        //.clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
            .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
