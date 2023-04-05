//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import SwiftUI

struct UserDetailView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let user: User
    
    @State var tags: [String: ColorCombination] = [:]
    @State var friendTags: [String: ColorCombination] = [:]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        HStack {
                            Text(user.name)
                                .font(.title.bold())
                            
                            Spacer()
                            
                            Image(systemName: "\(user.age).circle")
                                .font(.largeTitle)
                            
                        }
                        
                        HStack {
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        
                        HStack {
                            Image(systemName: "calendar")
                            Text("Joined on \(user.registered.formatted(date: .abbreviated, time: .omitted))")
                                .font(.subheadline)
                        }
                    }
                }
                
                Divider()
                
                // Bugged - the first HStack is not impacted by alignment etc.
                Section {
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack {
                            Image(systemName: "bag")
                            Text("\(user.company)")
                        }
                        
                        HStack {
                            Image(systemName: "house")
                            Text("\(user.address)")
                        }
                    }
                }
                
                Section {
                    HStack(alignment: .center) {
                        HStack(alignment: .center) {
                            Spacer()
                            VStack(alignment: .leading, spacing: 12) {
                                Text(user.about)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(.regularMaterial)
                                    .foregroundColor(.primary)
                                    .clipShape(RoundedRectangle(cornerRadius: 25))
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack {
                                        ForEach(user.tags, id: \.self) { tag in
                                            Text(tag)
                                                .font(.caption)
                                                .padding(10)
                                                .padding(.horizontal, 15)
                                                .background(Color(hex: tags[tag]?.backgroundColor ?? "#000000"))
                                                .foregroundColor(Color(hex: tags[tag]?.rawValue ?? "#FFFFFF"))
                                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                        }
                                    }
                                }
                            }
                            Spacer()
                        }
                    }
                }
                
                Divider()
                Section {
                    HStack {
                        Image(systemName: "person")
                            .font(.title)
                        Text("Friends")
                            .font(.title)
                    }
                    
                    FriendsScrollView(friends: user.friends, friendTags: friendTags)
                }
                
                Spacer()
                
                Spacer()
            }
            .padding()
            .navigationTitle(user.name)
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                generateColorCombinations()
            }
        }
    }
    
    private func generateColorCombinations() {
        user.tags.forEach { tag in
            self.tags.updateValue(ColorCombination.allCases.randomElement()!, forKey: tag)
        }
        
        user.friends.forEach { friend in
            self.friendTags.updateValue(ColorCombination.allCases.randomElement()!, forKey: friend.name)
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            UserDetailView(user: User.test)
        }
    }
}
