//
//  Mission.swift
//  P08D Moonshot
//
//  Created by Julian Moorhouse on 19/02/2021.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "Never launched"
        }
    }
    
    var crewDisplay: String {
        let stringArray = crew.map{ String($0.name.capitalized)}
        return stringArray.joined(separator: ", ")

    }
}
