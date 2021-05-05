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
        self.people = []
        loadData()
    }
    
    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func loadData() {
        let filename = getDocumentDirectory().appendingPathComponent(Self.saveKey)
        
        do {
            let fileExists = try filename.checkResourceIsReachable()
            if fileExists {
                do {
                    let data = try Data(contentsOf: filename)
                    people = try JSONDecoder().decode([Prospect].self, from: data)
                } catch {
                    print("Unable to load saved data. \(error.localizedDescription)")
                    print("\(error)")
                }
            } else {
                print("FILE NOT AVAILABLE")
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    private func save() {
        do {
            let filename = getDocumentDirectory().appendingPathComponent(Self.saveKey)
            let data = try JSONEncoder().encode(people)

            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            print("Saved correctly")
        } catch {
            print("Unable to save data. \(error.localizedDescription)")
            print("\(error)")
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
