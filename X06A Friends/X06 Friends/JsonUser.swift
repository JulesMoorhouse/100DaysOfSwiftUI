//
//  User.swift
//  X06 Friends
//
//  Created by Julian Moorhouse on 04/04/2021.
//

import Foundation

struct JsonUser: Codable, Identifiable {
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
    let friends: [JsonFriend]
}
