//
//  FriendsScrollView.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/05.
//

import SwiftUI

struct FriendsScrollView: View {
    
    let friends: [Friend]
    let friendTags: [String: ColorCombination]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(friends, id: \.id) { friend in
                    ColoredTagView(
                        text: friend.name,
                        foregroundColor: Color(hex: friendTags[friend.name]?.rawValue ?? "#FFFFFF"),
                        backgroundColor: Color(hex: friendTags[friend.name]?.backgroundColor ?? "#000000")
                    )
                }
            }
        }
    }
}

struct FriendsScrollView_Previews: PreviewProvider {
    
    static var friends: [Friend] = {
        return [
            Friend(id: "0", name: "Harry Potter"),
            Friend(id: "1", name: "Hermione Granger"),
            Friend(id: "2", name: "Ron Weasley")
        ]
    }()
    
    private static var friendTags: [String: ColorCombination] = {
        var tags: [String: ColorCombination] = [:]
        friends.forEach { friend in
            tags.updateValue(ColorCombination.allCases.randomElement()!, forKey: friend.name)
        }
        return tags
    }()
    
    static var previews: some View {
        FriendsScrollView(
            friends: friends,
            friendTags: friendTags
        )
    }
}
