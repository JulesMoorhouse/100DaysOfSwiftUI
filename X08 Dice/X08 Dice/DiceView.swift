//
//  DiceView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 16/05/2021.
//

import SwiftUI

struct DiceView: View {
    @Binding var dice: DiceItem
    @Binding var isRotating: Bool

    let maxRows: Int = 3
    let maxCols: Int = 3
    
    var body: some View {
        VStack {
            Text("Total: \(dice.total)")
                .font(.headline)
                .foregroundColor(.secondary)
            
            GridStack(rows: maxRows, columns: maxCols, spacing: 5) { row, col in
                if let idx = self.rowColToIndex(row, col) {
                    CellView(dice: $dice,
                             isRotating: $isRotating,
                             row: row,
                             col: col,
                             index: idx)
                        .frame(width: 80, height: 80)
                }
            }
            .frame(width: 260, height: 260, alignment: .center)
        }
    }
    
    func rowColToIndex(_ row: Int, _ col: Int) -> Int? {
        var index: Int = -1
        var found = false
        
        for r in 0 ... row {
            for c in 0 ..< self.maxCols {
                if r == row {
                    if c < col {
                        index += 1
                        found = true
                    }
                }
                else {
                    index += 1
                    found = true
                }
            }
        }
        return found ? index : nil
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(dice: .constant(DiceItem(sides: 4, numberOfDice: 4)), isRotating: .constant(true))
    }
}
