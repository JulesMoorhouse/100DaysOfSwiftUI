//
//  User.swift
//  X06 Friends
//
//  Created by Julian Moorhouse on 04/04/2021.
//

import Foundation

struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date?
    let tags: [String]
    let friends: [Friend]
    
    var formattedRegisteredDate: String {
        if let registeredDate = registered {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: registeredDate)
        } else {
            return "N/A"
        }
    }
    
    var initials: String {
        let initials = name.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
        return initials
    }
}
