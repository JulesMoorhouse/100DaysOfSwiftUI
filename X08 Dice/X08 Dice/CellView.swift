//
//  CellView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 16/05/2021.
//

import Shapes
import SwiftUI

struct CellView: View {
    let sides: UInt
    let row: Int
    let col: Int
    let text: String
    
    var body: some View {
        ZStack {
            RegularPolygon(sides: sides)
                .stroke(Color.blue, lineWidth: 4)
                .shadow(radius: 4.0, x: 2.0, y: 2.0)

            Text(text)
                .font(.title)
                .foregroundColor(.blue)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(sides: 4, row: 1, col: 1, text: "A")
    }
}
