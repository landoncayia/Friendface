//
//  UserDetailView.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(user.name)
                        .font(.title.weight(.semibold))
                        .padding(.bottom, 1)
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .foregroundColor(user.isActive ? .green : .gray)
                }
                
                Text("Age: \(user.age)")
                
                Text("Works at \(user.company)")
                
                Text("User since \(user.registered, format: .dateTime.year())")
                
                Divider()
                
                Text("Friend List")
                    .font(.title2)
                    .padding(.bottom, 1)
                
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(user: User(id: "123456", isActive: false, name: "James Jenkins", age: 34, company: "Apple", email: "jjenkins@apple.com", address: "42 California Rd, Cupertino, CA 94024", about: "I have been a dedicated iOS developer since the beginning.", registered: Date(), tags: ["happy", "booknerd"], friends: []))
    }
}
