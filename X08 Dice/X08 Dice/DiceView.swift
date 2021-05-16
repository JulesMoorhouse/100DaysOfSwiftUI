//
//  DiceView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 16/05/2021.
//

import SwiftUI

struct DiceView: View {
    @Binding var sides: Int
    @Binding var values: [Int]

    let maxRows: Int = 3
    let maxCols: Int = 3
    
    var body: some View {
        GridStack(rows: maxRows, columns: maxCols, spacing: 10) { row, col in
            if let idx = self.rowColToIndex(row, col) {
                CellView(sides: self.$sides,
                         row: row,
                         col: col,
                         values: self.$values,
                         index: idx)
                    .frame(width: 100, height: 100)
            }
        }
        .frame(width: 300, height: 300, alignment: .center)
        .padding()
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
        DiceView(sides: .constant(5), values: .constant([3,4,5,6]))
    }
}
