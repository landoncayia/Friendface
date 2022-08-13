//
//  Friend.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import Foundation

/// A struct that represents one of a user's friends.
struct Friend: Codable, Identifiable {
    var id: String
    var name: String
}
