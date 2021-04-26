//
//  ContentView.swift
//  P10C CupcakeCorner
//
//  Created by Julian Moorhouse on 12/03/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var cupCakes = CupCakes()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $cupCakes.order.type) {
                        ForEach(0 ..< Order.types.count, id: \.self) {
                            Text(Order.types[$0])
                        }
                    }
                    
                    Stepper(value: $cupCakes.order.quantity, in: 3 ... 20) {
                        Text("Number of cakes: \(cupCakes.order.quantity)")
                    }
                }
                
                Section {
                    Toggle(isOn: $cupCakes.order.specialRequestEnabled.animation()) {
                        Text("Any special requests?")
                    }
                    
                    if cupCakes.order.specialRequestEnabled {
                        Toggle(isOn: $cupCakes.order.extraFrosting) {
                            Text("Add extra frosting")
                        }
                        
                        Toggle(isOn: $cupCakes.order.addSprinkles) {
                            Text("Add extra sprinkles")
                        }
                    }
                }
                
                Section {
                    NavigationLink(destination:
                                    AddressView(cupCakes: cupCakes)) {
                        Text("Delivery details")
                    }
                }
            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
