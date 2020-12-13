//
//  ContentView.swift
//  P06E Animations
//
//  Created by Julian Moorhouse on 12/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged{self.dragAmount = $0.translation}
                    //.onEnded{_ in self.dragAmount = .zero}
                    // Explicit animation
                    .onEnded{_ in
                        withAnimation(.spring()) {
                            self.dragAmount = .zero
                        }
                    }
                
        )
        // Implicit animation
        //.animation(.spring())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
