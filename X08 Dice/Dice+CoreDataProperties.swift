//
//  Dice+CoreDataProperties.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 17/05/2021.
//
//

import CoreData
import Foundation

public extension Dice {
    @nonobjc class func fetchRequest() -> NSFetchRequest<Dice> {
        return NSFetchRequest<Dice>(entityName: "Dice")
    }

    @NSManaged var values: String?
    @NSManaged var sides: Int16
    @NSManaged var number: Int16

    var valuesArray: [Int] {
        if let temp = self.values {
        
        return temp
            .components(separatedBy: ",")
            .map {
                word in (Int(word.trimmingCharacters(in: CharacterSet.whitespaces))!)
            }
        }
        
        return [Int]()
    }
}

extension Dice: Identifiable {}
