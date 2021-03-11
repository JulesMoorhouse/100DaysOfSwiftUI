//
//  ActivityView.swift
//  X05 Tracking
//
//  Created by Julian Moorhouse on 11/03/2021.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var activities: Activities
    @State var selectedItem: Activity

    var body: some View {
        VStack(alignment: .leading) {
                Text(selectedItem.title)
                    .font(.title)
                    .padding(.bottom)
            
                Text(selectedItem.description)
                    .padding(.bottom)
            
                Text("\(selectedItem.amount)")
                    .font(.headline)
                
            Button(action: {
                self.selectedItem.amount += 1
                self.saveActivity()
            }) {
                Text("+")
            }
                Spacer()
            }
    }
    
    func saveActivity() {
        guard let index = activities.items.firstIndex(where: {$0.id == selectedItem.id }) else { return }
        activities.items[index].amount = selectedItem.amount
    }
}
