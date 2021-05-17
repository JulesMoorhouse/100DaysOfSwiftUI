//
//  DiceListView.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 17/05/2021.
//

import SwiftUI

struct DiceListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Dice.entity(), sortDescriptors: []) var dice: FetchedResults<Dice>

    var body: some View {
        Form {
            List {
                ForEach(dice, id: \.self) { item in
                    Section {
                        HStack {
                            Spacer()
                            DiceView(dice: .constant(self.data(db: item)), isRotating: .constant(false))
                            Spacer()
                        }
                    }
                }
            }
        }
    }

    func data(db: Dice) -> DiceItem {
        return DiceItem(sides: Int(db.sides),
                        values: db.valuesArray,
                        numberOfDice: Int(db.number))
    }
}

struct DiceListView_Previews: PreviewProvider {
    static var previews: some View {
        DiceListView()
    }
}
