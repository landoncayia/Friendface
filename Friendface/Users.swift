//
//  Users.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import Foundation

class Users: ObservableObject {
    @Published var users = [User]()
    
    init(users: [User]) {
        self.users = users
    }
}
