//
//  DiceItem.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 17/05/2021.
//

import Foundation

struct DiceItem {
    var sides: Int
    var values: [Int] = []
    var numberOfDice: Int
    //var isRotating: Bool = false
    
    var total: Int {
        if !values.isEmpty {
            return values.reduce(0, +)
        }
        else
        {
            return 0
        }
    }

}
