//
//  ContentView.swift
//  P17K Flashzilla
//
//  Created by Julian Moorhouse on 06/05/2021.
//

import SwiftUI

// So, when Reduce Motion Enabled is true the closure code that’s passed in is executed immediately, otherwise it’s passed along using withAnimation(). The whole throws/rethrows thing is more advanced Swift, but it’s a direct copy of the function signature for withAnimation() so that the two can be used interchangeably.
func withOptionalAnimation<Result>( _ animation: Animation? = .default, _ body: () throws -> Result ) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct ContentView: View {
    //@Environment(\.accessibilityReduceMotion) var reduceMotion
    @State private var scale: CGFloat = 1
    
    var body: some View {
        Text("Hello, world!")
            .scaleEffect(scale)
            .onTapGesture {
//                if self.reduceMotion {
//                    self.scale *= 1.5
//                } else {
//                    withAnimation {
                    withOptionalAnimation {
                        self.scale *= 1.5
                    }
                //}
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
