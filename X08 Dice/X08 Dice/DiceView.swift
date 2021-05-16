//
//  DiceView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 16/05/2021.
//

import SwiftUI

struct DiceView: View {
    var sides: Int
    var values: [Int]
    
    let maxRows: Int = 3
    let maxCols: Int = 3
    
    var body: some View {
        GridStack(rows: maxRows, columns: maxCols, spacing: 10) { row, col in
            if let text = self.text(row, col) {
                CellView(sides: UInt(self.sides),
                         row: row,
                         col: col,
                         text: "\(text)")
                    .frame(width: 100, height: 100)
            }
        }
        .frame(width: 300, height: 300, alignment: .center)
    }
    
    func text(_ row: Int, _ col: Int) -> String? {
        let index = self.rowColToIndex(row, col)
        
        return self.values.count > index ?
            String(self.values[index]) :
            nil
    }
    
    func rowColToIndex(_ row: Int, _ col: Int) -> Int {
        var index: Int = 0
        for r in 0 ... row {
            for c in 0 ..< self.maxCols {
                if r == row {
                    if c < col {
                        index += 1
                    }
                }
                else {
                    index += 1
                }
            }
        }
        return index
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView(sides: 5, values: [3,4,5,6])
    }
}
