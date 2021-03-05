//
//  ContentView.swift
//  P09I Drawing
//
//  Created by Julian Moorhouse on 05/03/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var amount: CGFloat = 0.0
    
    var body: some View {
        VStack {
            Image("example")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(Double(amount))
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
