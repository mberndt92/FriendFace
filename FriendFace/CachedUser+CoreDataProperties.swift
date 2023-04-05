//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/05.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    @NSManaged public var tags: String?
    @NSManaged public var friends: NSSet?
    
    private var wrappedId: String {
        return id ?? "No Id"
    }
    
    private var wrappedName: String {
        return name ?? "Harry Potter"
    }
    
    private var wrappedCompany: String {
        return company ?? "Hogwarts School of Wizardry"
    }
    
    private var wrappedEmail: String {
        return email ?? "harry.potter@hogwarts.com"
    }
    
    private var wrappedAddress: String {
        return address ?? "4 Privet Drive, Little Whinging, Surrey"
    }
    
    private var wrappedAbout: String {
        return about ?? "Nothing to say..."
    }
    
    private var wrappedRegistered: Date {
        return registered ?? Date.now
    }
    
    private var wrappedTags: [String] {
        let cachedTag = tags ?? ""
        return cachedTag.components(separatedBy: ", ")
    }
    
    var wrappedFriends: [Friend] {
        guard let cachedFriends = friends as? Set<CachedFriend> else {
            return []
        }
        
        let friends: [Friend] = cachedFriends.map { cachedFriend in
            return Friend(id: cachedFriend.wrappedId, name: cachedFriend.wrappedName)
        }
        
        return friends
    }
    
    var wrappedUser: User {
        return User(
            id: wrappedId,
            isActive: isActive,
            name: wrappedName,
            age: Int(age),
            company: wrappedCompany,
            email: wrappedEmail,
            address: wrappedAddress,
            about: wrappedAbout,
            registered: wrappedRegistered,
            tags: wrappedTags,
            friends: wrappedFriends
        )
    }
}

// MARK: Generated accessors for friends
extension CachedUser {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: CachedFriend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: CachedFriend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}

extension CachedUser : Identifiable {

}
