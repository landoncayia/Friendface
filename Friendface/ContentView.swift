//
//  ContentView.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userList = UserList(users: [User]())
    
    var body: some View {
        NavigationView {
            List(userList.users) { user in
                VStack(alignment: .leading) {
                    Text(user.name)
                        .font(.headline)
                    Text(user.email)
                }
            }
            .navigationTitle("Friendface")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add Examples") {
                        let james = User(id: "123456", isActive: false, name: "James Jenkins", age: 34, company: "Apple", email: "jjenkins@apple.com", address: "42 California Rd, Cupertino, CA 94024", about: "I have been a dedicated iOS developer since the beginning.", registered: Date(), tags: ["happy", "booknerd"])
                        userList.users.append(james)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
