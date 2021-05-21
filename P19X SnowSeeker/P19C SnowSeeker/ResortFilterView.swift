//
//  ResortFilterView.swift
//  P19C SnowSeeker
//
//  Created by Julian Moorhouse on 21/05/2021.
//

import SwiftUI

// list of country
// segement tabs x 3 for size - All, $$, $$$
// segement tabs - size - All, small, average, large
struct ResortFilterView: View {
    @Environment(\.presentationMode) var presentationMode

    @State private var selectedCountry = 1
    @State private var selectedPrice: Int = 0
    @State private var selectedCountrySize: Int = 0

    let possiblePrices = ["All", "$", "$$"]
    let possibleCountrySizes = ["All", "Small", "Medium", "Large"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("").accessibility(hidden: true)) {
                    Picker("Country", selection: $selectedCountry) {
                        ForEach(0 ..< 20) {
                            Text("\($0)")
                        }
                    }
                }

                Section(header: Text("").accessibility(hidden: true)) {
                    VStack(alignment: .leading) {
                        Text("Price")
                        Picker("", selection: $selectedPrice) {
                            ForEach(0 ..< possiblePrices.count) {
                                Text("\(self.possiblePrices[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                
                Section(header: Text("").accessibility(hidden: true)) {
                    VStack(alignment: .leading) {
                        Text("Country size")
                        Picker("", selection: $selectedCountrySize) {
                            ForEach(0 ..< possibleCountrySizes.count) {
                                Text("\(self.possibleCountrySizes[$0])")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
            }
            .navigationBarTitle("Resorts Filter")
            .navigationBarItems(trailing: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
             }) {
                 Text("Done").bold()
             })
        }
    }
}

struct ResortFilterView_Previews: PreviewProvider {
    static var previews: some View {
        ResortFilterView()
    }
}
