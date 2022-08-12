//
//  ContentView.swift
//  Friendface
//
//  Created by Landon Cayia on 8/12/22.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationView {
            List(users) { user in
                HStack {
                    VStack(alignment: .leading, spacing: 3) {
                        Text(user.name)
                            .font(.headline)
                        
                        Text("Registered in \(user.registered, format: .dateTime.year())")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "circle.fill")
                        .foregroundColor(user.isActive ? .green : .gray)
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Friendface")
        }
    }
    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
