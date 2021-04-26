//
//  Order.swift
//  P10C CupcakeCorner
//
//  Created by Julian Moorhouse on 12/03/2021.
//

import SwiftUI

struct Order: Identifiable, Codable {

    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var id = UUID()
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if specialRequestEnabled == false {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            streetAddress.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            city.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
            zip.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            return false
        }
        
        return true
    }
    
    var cost: Double {
        var cost = Double(quantity) * 2
        cost += Double(type) / 2
        
        if extraFrosting {
            cost += Double(quantity)
        }
        
        if addSprinkles {
            cost += Double(quantity) / 2
        }
        
        return cost
    }
}

class CupCakes : ObservableObject {
    @Published var order: Order
    
    init () {
        self.order = Order()
    }
}
  
