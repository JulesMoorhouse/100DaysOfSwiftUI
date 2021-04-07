//
//  User+CoreDataProperties.swift
//  X06 Friends
//
//  Created by Julian Moorhouse on 07/04/2021.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var timestamp: Date?
    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friend: NSSet?

    public var wrappedName: String {
        name ?? "Unknown Name"
    }

    public var wrappedCompany: String {
        company ?? "Unknown Country"
    }

    public var wrappedEmail: String {
        company ?? "Unknown Email"
    }

    public var wrappedAddress: String {
        address ?? "Unknown Address"
    }
    
    public var wrappedAbout: String {
        about ?? "Unknown About"
    }
    
    public var wrappedTags: String {
        tags ?? ""
    }
    
    public var friendsArray: [User] {
        let set = friend as? Set<User> ?? []

        return set.sorted { $0.wrappedName < $1.wrappedName }
    }

    
    var formattedRegisteredDate: String {
        if let registeredDate = registered {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: registeredDate)
        } else {
            return "N/A"
        }
    }
    
    var initials: String {
        let initials = name!.components(separatedBy: " ").reduce("") { ($0 == "" ? "" : "\($0.first!)") + "\($1.first!)" }
        return initials
    }
}

// MARK: Generated accessors for friend
extension User {

    @objc(addFriendObject:)
    @NSManaged public func addToFriend(_ value: User)

    @objc(removeFriendObject:)
    @NSManaged public func removeFromFriend(_ value: User)

    @objc(addFriend:)
    @NSManaged public func addToFriend(_ values: NSSet)

    @objc(removeFriend:)
    @NSManaged public func removeFromFriend(_ values: NSSet)

}

extension User : Identifiable {

}
