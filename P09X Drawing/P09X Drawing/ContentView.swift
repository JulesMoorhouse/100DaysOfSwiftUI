//
//  ContentView.swift
//  P09X Drawing
//
//  Created by Julian Moorhouse on 08/03/2021.
//

import SwiftUI

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let quarterX = (rect.midX - rect.minX) / 2
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + quarterX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.minX + quarterX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + quarterX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + quarterX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}


struct ColorCyclingRect: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: CGFloat(value))
                    .strokeBorder(self.color(for: value, brightness: 1), lineWidth: 1)
            }
        }
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(self.steps) + self.amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}

struct ContentView: View {
    @State private var lineWidth: CGFloat = 10.0
    @State private var colorCycle = 0.5

    var body: some View {
        VStack(spacing: 30) {
            
            Spacer()
            
            Group {
                Arrow()
                    .stroke(Color.red, style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))

                    .onTapGesture {
                        withAnimation(.linear(duration: 1)) {
                            self.lineWidth = self.lineWidth == 10.0 ? 20.00 : 10.0
                        }
                    }
                    .frame(width: 300)
                Text("Tap arrow")
            }
            
            Group {
                ColorCyclingRect(amount: self.colorCycle)
                      .frame(width: 300)
                  
                Text("Cycle colour: \(colorCycle)")

                Slider(value: $colorCycle)
                    .padding([.horizontal, .bottom])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
