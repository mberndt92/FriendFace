//
//  ContentView.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import SwiftUI

struct ContentView: View {
    
    private var apiController = ApiController()
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var cachedUsers: FetchedResults<CachedUser>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(cachedUsers, id: \.id) { user in
                    NavigationLink {
                        UserDetailView(user: user.wrappedUser)
                    } label: {
                        HStack {
                            Text(user.wrappedUser.name)
                            Spacer()
                            Image(
                                systemName: "circle.fill"
                            )
                            .foregroundColor(user.wrappedUser.isActive ? .green : .red)
                        }
                    }
                }
            }
            .onAppear {
                Task {
                    await fetchUsers()
                }
            }
        }
    }
    
    func fetchUsers() async {
        let users = await apiController.fetchUsers()
        await MainActor.run {
            users.forEach { user in
                let cachedUser = CachedUser(context: moc)

                cachedUser.id = user.id
                cachedUser.isActive = user.isActive
                cachedUser.name = user.name
                cachedUser.age = Int16(user.age)
                cachedUser.address = user.address
                cachedUser.email = user.email
                cachedUser.about = user.about
                cachedUser.tags = user.tags.joined(separator: ", ")
                cachedUser.company = user.company
                cachedUser.registered = user.registered
                
                var cachedFriends: [CachedFriend] = []
                user.friends.forEach { friend in
                    let cachedFriend = CachedFriend(context: moc)
                    cachedFriend.id = friend.id
                    cachedFriend.name = friend.name

                    cachedFriends.append(cachedFriend)
                }

                cachedUser.friends = NSSet(array: cachedFriends)
                
            }
            try? moc.save()
            
        }
    }
}
