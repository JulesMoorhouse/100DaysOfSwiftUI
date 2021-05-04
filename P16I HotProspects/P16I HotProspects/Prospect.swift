//
//  Prospect.swift
//  P16I HotProspects
//
//  Created by Julian Moorhouse on 03/05/2021.
//

import SwiftUI

class Prospect: Identifiable, Codable {
    var id = UUID()
    var name = "Anonymous"
    var emailAddress = ""
    fileprivate(set) var isContacted = false // fileprivate(set) is used to stop us from accidentally setting isContacted in our code.
    
}

class Prospects: ObservableObject {
    @Published private(set) var people: [Prospect] // private(set) used to stop array being updated outside of this class
    static let saveKey = "SavedData"
    
    init() {
        // Notice Self.saveKey has a captial S
        if let data = UserDefaults.standard.data(forKey: Self.saveKey) {
            if let decoded = try? JSONDecoder().decode([Prospect].self, from: data) {
                self.people = decoded
                return
            }
        }
        
        self.people = []
    }
    
    private func save() {
        if let encoded = try? JSONEncoder().encode(people) {
            UserDefaults.standard.set(encoded, forKey: Self.saveKey)
        }
    }
    
    func add(_ prospect: Prospect) {
        people.append(prospect)
        save()
    }
    
    func toggle(_ prospect: Prospect) {
        objectWillChange.send() // Called before animations are correct
        prospect.isContacted.toggle()
        save()
    }
}
