//
//  UserDetailView.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import SwiftUI

/// A view that shows details about a user's profile.
struct UserDetailView: View {
    let user: CachedUser
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Text(user.wrappedName)
                        .font(.title.weight(.semibold))
                        .padding(.bottom, 1)
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .foregroundColor(user.isActive ? .green : .gray)
                }
                
                Text("Age: \(user.age)")
                
                Text("Works at \(user.wrappedCompany)")
                
                Text("User since \(user.wrappedRegistered, format: .dateTime.year())")
                
                Divider()
                
                Text("Friend List")
                    .font(.title2)
                    .padding(.bottom, 1)
                
                ForEach(user.friendsArray) { friend in
                    Text(friend.wrappedName)
                }
                
                Divider()
                
                Text("Tags")
                    .font(.title2)
                    .padding(.bottom, 1)
                
                ForEach(user.wrappedTags.components(separatedBy: ","), id: \.self) { tag in
                    Text(tag)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
