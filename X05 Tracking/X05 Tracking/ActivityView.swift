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
            Text(selectedItem.description)
                .foregroundColor(.secondary)
                .padding(.bottom)

            HStack(spacing: 10) {
                Text("\(selectedItem.amount)")
                    .font(.title)

                Button(action: {
                    self.selectedItem.amount += 1
                    self.saveActivity()
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(5)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .frame(maxWidth: 30, maxHeight: 30)
                        .clipShape(Circle())
                }
                Spacer()
            }
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0))
        .navigationBarTitle(selectedItem.title)
    }

    func saveActivity() {
        guard let index = activities.items.firstIndex(where: { $0.id == selectedItem.id }) else { return }
        activities.items[index].amount = selectedItem.amount
    }
}
