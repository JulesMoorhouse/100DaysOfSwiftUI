//
//  ViewModifiers.swift
//  X04 Times Tables
//
//  Created by Julian Moorhouse on 31/12/2020.
//  Copyright © 2020 Mindwarp Consultancy Ltd. All rights reserved.
//

import SwiftUI

struct ScreenTitle: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.largeTitle)
                .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 30))
                .background(Color.yellow)
                .clipShape(Capsule())
        }
        .padding(EdgeInsets(top: 20, leading: 0, bottom: 30, trailing: 0))
    }
}

struct SecondaryTitle: ViewModifier {
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.headline)
        }
        .padding(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
    }
}

struct CapsuleButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 100, minHeight: 44)
            .background(Color.blue)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding(20)
        
    }
}

extension View {
    func ScreenTitleStyle() -> some View {
        self.modifier(ScreenTitle())
    }
    func SecondaryTitleStyle() -> some View {
        self.modifier(SecondaryTitle())
    }
    func CapsuleButtonStyle() -> some View {
        self.modifier(CapsuleButton())
    }
}
