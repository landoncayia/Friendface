//
//  User.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import Foundation

/// A struct that represents an instance of a user.
struct User: Codable, Identifiable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
}
