//
//  User.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import Foundation

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    static var test: User {
        return User(id: "0", isActive: true, name: "Harry Potter", age: 21, company: "Hogwarts, Wizarding School", email: "harry.potter@hogwarts.com", address: "21 Liddleton", about: "About Harry", registered: Date.now, tags: ["Wizard", "Auror", "Dad"], friends: [Friend(id: "1", name: "Hermione Granger"), Friend(id: "2", name: "Ron Weasley")])
    }
}
