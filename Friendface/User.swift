//
//  User.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import Foundation

struct User: Codable {
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
    // Need to write a Friend struct first
//    let friends: [Friend]
}
