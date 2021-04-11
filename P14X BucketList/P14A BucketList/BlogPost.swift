//
//  BlogPost.swift
//  P14A BucketList
//
//  Created by Julian Moorhouse on 11/04/2021.
//

import Foundation

struct BlogPost: Decodable, Encodable {
    let title: String
    let url: URL
    let views: Int
}
