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
        List {
            ForEach(dice, id: \.self) { item in
                Text(item.values ?? "")
            }
        }
    }
}

struct DiceListView_Previews: PreviewProvider {
    static var previews: some View {
        DiceListView()
    }
}
