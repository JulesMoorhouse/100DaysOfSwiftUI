//
//  CellView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 16/05/2021.
//

import Shapes
import SwiftUI

struct CellView: View {
    @Binding var sides: Int
    @Binding var values: [Int]
    @Binding var isRotating: Bool
    var row: Int
    var col: Int
    var index: Int
    
    var text: String? {
         values.count > index ?
            String(values[index]) :
            nil
    }
    
    var body: some View {
        if text != nil {
            ZStack {
                RegularPolygon(sides: UInt(sides))
                    .stroke(Color.blue, lineWidth: 4)
                    .shadow(radius: 4.0, x: 2.0, y: 2.0)

                Text(text ?? "")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            .rotationEffect(Angle.degrees(isRotating ? 360 : 0))
            .animation(.default)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(sides: .constant(4), values: .constant([1,2,4,6]), isRotating: .constant(true), row: 1, col: 1, index: 2)
    }
}
