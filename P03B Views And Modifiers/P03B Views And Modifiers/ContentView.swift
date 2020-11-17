//
//  ContentView.swift
//  P03B Views And Modifiers
//
//  Created by Julian Moorhouse on 17/11/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct CapsuleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .padding()
            .background(Color.blue)
            .clipShape(Capsule())
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct Watermark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black)
        }
    }
}

extension View {
    func watermarked(with text: String) -> some View {
        self.modifier(Watermark(text: text))
    }
}

struct ContentView: View {
    var body: some View {
        //        VStack(spacing: 10) {
        //            CapsuleText(text: "First")
        //                .foregroundColor(.white)
        //
        //            CapsuleText(text: "Second")
        //                .foregroundColor(.yellow)
        //        }
        // ---
        //    Text("Hello World!")
        //        .titleStyle()
        //        //.modifier(Title())
        //    }
        // ---
        Color.blue
            .frame(width: 300, height: 300)
            .watermarked(with: "Hacking with Swift")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
