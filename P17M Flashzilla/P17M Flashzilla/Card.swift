//
//  Card.swift
//  P17M Flashzilla
//
//  Created by Julian Moorhouse on 06/05/2021.
//

import Foundation

struct Card {
    let prompt: String
    var answer: String
    
    static var example: Card {
        Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
    }
}
