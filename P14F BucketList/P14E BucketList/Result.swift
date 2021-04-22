//
//  Result.swift
//  P14E BucketList
//
//  Created by Julian Moorhouse on 22/04/2021.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
