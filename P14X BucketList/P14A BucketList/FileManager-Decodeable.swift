//
//  FileManager-Decodeable.swift
//  P14A BucketList
//
//  Created by Julian Moorhouse on 11/04/2021.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL? {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = getDocumentsDirectory()?.appendingPathComponent(file) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd" // JSON file data format
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
