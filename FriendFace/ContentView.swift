//
//  ContentView.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import SwiftUI

struct ContentView: View {
    
    private var apiController = ApiController()
    @State private var users: [User] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.id) { user in
                    NavigationLink {
                       UserDetailView(user: user)
                    } label: {
                        HStack {
                            Text(user.name)
                            Spacer()
                            Image(
                                systemName: "circle.fill"
                            )
                            .foregroundColor(user.isActive ? .green : .red)
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
        if users.isEmpty {
            users = await apiController.fetchUsers()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
