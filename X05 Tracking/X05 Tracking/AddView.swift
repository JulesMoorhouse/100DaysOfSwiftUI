//
//  AddView.swift
//  X05 Tracking
//
//  Created by Julian Moorhouse on 10/03/2021.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var activities: Activities
    @State private var name = ""
    @State private var description = ""
    @State private var amount = ""
    @State private var showingError = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $name)
                }

                Section {
                    ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                        if description.isEmpty {
                            TextField("Description", text: $description)
                                .disabled(true) // don't allow for it to be tapped
                                .multilineTextAlignment(.leading)
                        }

                        TextEditor(text: $description)
                            .padding(EdgeInsets(top: -7, leading: -4, bottom: -7, trailing: -4)) // fix padding not aligning with TextField
                            .multilineTextAlignment(.leading)
                    }
                    .frame(minHeight: 100.0)
                }

                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
            }
            .navigationBarTitle("Add new habit")
            .navigationBarItems(trailing:
                Button("Save") {
                    if let actualAmount = Int(self.amount) {
                        let item = Activity(title: self.name, description: self.description, amount: actualAmount)
                        self.activities.items.append(item)
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        self.showingError = true
                    }
                }
            )
            .alert(isPresented: $showingError) {
                Alert(title: Text("Amount"), message: Text("You didn't provide a valid number!"), dismissButton: .default(Text("OK"))
                    {
                        self.showingError = false
                })
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
