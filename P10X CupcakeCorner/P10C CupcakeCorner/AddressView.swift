//
//  AddressView.swift
//  P10C CupcakeCorner
//
//  Created by Julian Moorhouse on 12/03/2021.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var cupCakes = CupCakes()

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $cupCakes.order.name)
                TextField("Street Address", text: $cupCakes.order.streetAddress)
                TextField("City", text: $cupCakes.order.city)
                TextField("Zip", text: $cupCakes.order.zip)
            }

            Section {
                NavigationLink(destination:
                                CheckoutView(cupCakes: cupCakes)) {
                    Text("Check out")
                }
            }
            .disabled(cupCakes.order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(cupCakes: CupCakes())
    }
}
