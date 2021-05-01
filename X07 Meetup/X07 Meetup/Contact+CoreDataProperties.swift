//
//  Contact+CoreDataProperties.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 30/04/2021.
//
//

import Foundation
import CoreData

extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var photoFile: UUID?
    @NSManaged public var timestamp: Date?

    var wrappedFirstName: String {
        firstName ?? "Unknown first name"
    }
    
    var wrappedLastName: String {
        lastName ?? "Unknown last name"
    }
    
    var wrappedPhotoFile: UUID {
        photoFile ?? UUID()
    }
    
    var photoFileString: String {
        wrappedPhotoFile.uuidString
    }
}

extension Contact : Identifiable {

}
