//
//  Filter.swift
//  P19C SnowSeeker
//
//  Created by Julian Moorhouse on 21/05/2021.
//

import Foundation

struct Filter {
     var selectedCountry: String = "All"
     var selectedPrice: Int = 0
     var selectedCountrySize: Int = 0
    
    func matchCountry(country: String) -> Bool {
        if selectedCountry == "All" {
            return true
        }
        
        if selectedCountry == country {
            return true
        }
        
        return false
    }
    
    func matchPrice(price: Int) -> Bool {
        if selectedPrice == 0 {
            return true
        }
        
        if selectedPrice == price {
            return true
        }
        
        return false
    }

    func matchCountrySize(size: Int) -> Bool {
        if selectedCountrySize == 0 {
            return true
        }
        
        if selectedCountrySize == size {
            return true
        }
        
        return false
    }
}
