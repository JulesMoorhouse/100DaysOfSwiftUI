//
//  AddressView.swift
//  P10C CupcakeCorner
//
//  Created by Julian Moorhouse on 12/03/2021.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("Town", text: $order.town)
                TextField("County", text: $order.county)
                TextField("Postcode", text: $order.postCode)
            }

            Section {
                NavigationLink(destination:
                    CheckoutView(order: order)) {
                    Text("Check out")
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationBarTitle("Delivery details", displayMode: .inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
