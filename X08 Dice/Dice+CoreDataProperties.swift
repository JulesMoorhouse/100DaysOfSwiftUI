//
//  Dice+CoreDataProperties.swift
//  X08 Dice
//
//  Created by Julian Moorhouse on 17/05/2021.
//
//

import Foundation
import CoreData


extension Dice {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dice> {
        return NSFetchRequest<Dice>(entityName: "Dice")
    }

    @NSManaged public var values: String?
    @NSManaged public var sides: Int16
    @NSManaged public var number: Int16
    @NSManaged public var id: UUID?
    
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

extension Dice : Identifiable {

}
