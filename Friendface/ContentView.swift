//
//  ContentView.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [SortDescriptor(\.name)]) var cachedUsers: FetchedResults<CachedUser>
    
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(cachedUsers) { user in
                NavigationLink {
                    UserDetailView(user: user)
                } label: {
                    HStack {
                        VStack(alignment: .leading, spacing: 3) {
                            Text(user.wrappedName)
                                .font(.headline)
                            
                            Text("Registered in \(user.wrappedRegistered, format: .dateTime.year())")
                                .font(.subheadline)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "circle.fill")
                            .foregroundColor(user.isActive ? .green : .gray)
                    }
                }
            }
            .task {
                if users.isEmpty {
                    await loadData()
                }
            }
            .navigationTitle("Friendface")
        }
    }
    
    /// A function that downloads user JSON data from the internet and decodes it into Swift objects.
    func loadData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid data")
        }
        
        // Prevent Core Data from updating at the same time as SwiftUI updates its interface
        await MainActor.run {
            for user in users {
                let cachedUser = CachedUser(context: moc)
                cachedUser.id = user.id
                cachedUser.isActive = user.isActive
                cachedUser.name = user.name
                cachedUser.age = Int16(user.age)
                cachedUser.company = user.company
                cachedUser.email = user.email
                cachedUser.address = user.address
                cachedUser.about = user.about
                cachedUser.registered = user.registered
                cachedUser.tags = user.tags.joined(separator: ",")
                for friend in user.friends {
                    let cachedFriend = CachedFriend(context: moc)
                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name
                    cachedUser.addToFriends(cachedFriend)
                }
                
                if moc.hasChanges {
                    try? moc.save()
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
