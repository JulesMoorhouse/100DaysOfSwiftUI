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
    var backgroundColor: Color
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 100, minHeight: 44)
            .background(backgroundColor)
            .foregroundColor(.white)
            .clipShape(Capsule())
            .padding(20)
        
    }
}

struct RedCircleButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(20)
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.yellow, lineWidth: 4))
    }
}

struct SmallNumberTextField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .lineLimit(1)
            .multilineTextAlignment(.center)
            .frame(width: 50)
    }
}

extension View {
    func ScreenTitleStyle() -> some View {
        self.modifier(ScreenTitle())
    }
    func SecondaryTitleStyle() -> some View {
        self.modifier(SecondaryTitle())
    }
    func CapsuleButtonStyle(backgroundColor: Color) -> some View {
        self.modifier(CapsuleButton(backgroundColor: backgroundColor))
    }
    func RedCircleButtonStyle() -> some View {
        self.modifier(RedCircleButton())
    }
    func SmallNumberTextFieldStyle() -> some View {
        self.modifier(SmallNumberTextField())
    }
}
