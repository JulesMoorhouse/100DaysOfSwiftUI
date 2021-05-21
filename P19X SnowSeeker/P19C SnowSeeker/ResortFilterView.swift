//
//  ResortFilterView.swift
//  P19C SnowSeeker
//
//  Created by Julian Moorhouse on 21/05/2021.
//

import SwiftUI

struct ResortFilterView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var filter: Filter

    let countries: [String]
    let possiblePrices = ["All", "$", "$$"]
    let possibleCountrySizes = ["All", "Small", "Medium", "Large"]

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("").accessibility(hidden: true)) {
                    Picker("Country", selection: $filter.selectedCountry) {
                        ForEach(countries, id: \.self) {
                            Text("\($0)")
                        }
                    }
                }

                Section(header: Text("").accessibility(hidden: true)) {
                    VStack(alignment: .leading) {
                        Text("Price")
                        Picker("", selection: $filter.selectedPrice) {
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
                        Picker("", selection: $filter.selectedCountrySize) {
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
        ResortFilterView(filter: .constant(Filter()), countries: ["France", "Germany"])
    }
}
