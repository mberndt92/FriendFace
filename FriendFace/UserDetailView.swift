//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import SwiftUI

struct UserDetailView: View {
    
    enum ColorCombination: String, CaseIterable {
        case whiteOnDarkSlateGray = "#FFFFFF"
        case blackOnLightGray = "#000000"
        case darkRedOnLemonChiffon = "#8B0000"
        case navyOnMintCream = "#000080"
        case forestGreenOnIvory = "#228B22"
        case darkOrangeOnLavender = "#FF8C00"
        case crimsonOnHoneydew = "#DC143C"
        case darkOrchidOnOldLace = "#9932CC"
        case dodgerBlueOnFloralWhite = "#1E90FF"
        case indigoOnPeachPuff = "#4B0082"

        var foregroundColor: String {
            return self.rawValue
        }
        
        var backgroundColor: String {
            switch self {
            case .whiteOnDarkSlateGray:
                return "#2F4F4F"
            case .blackOnLightGray:
                return "#D3D3D3"
            case .darkRedOnLemonChiffon:
                return "#FFFACD"
            case .navyOnMintCream:
                return "#F5FFFA"
            case .forestGreenOnIvory:
                return "#FFFFF0"
            case .darkOrangeOnLavender:
                return "#E6E6FA"
            case .crimsonOnHoneydew:
                return "#F0FFF0"
            case .darkOrchidOnOldLace:
                return "#FDF5E6"
            case .dodgerBlueOnFloralWhite:
                return "#FFFAF0"
            case .indigoOnPeachPuff:
                return "#FFDAB9"
            }
        }
    }

    
    @Environment(\.dismiss) var dismiss
    
    let user: User
    
    @State var tags: [String: ColorCombination] = [:]
    @State var friendTags: [String: ColorCombination] = [:]
    
    var body: some View {
        VStack(alignment: .leading) {

            Section {
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(user.name)
                            .font(.title.bold())
                        
                        Spacer()
                        
                        Image(systemName: "\(user.age).circle")
                            .font(.largeTitle)
//                        Text(String(user.age))
//                            .font(.title)
//                            .padding(10)
//                            .background(Color.gray)
//                            .foregroundColor(.white)
//                            .clipShape(Circle())
                            
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
                        VStack(spacing: 12) {
                            Text(user.about)
                                .multilineTextAlignment(.leading)
                            
                            HStack(spacing: 8) {
                                ForEach(user.tags, id: \.self) { tag in
                                    Text(tag)
                                        .padding(10)
                                        .padding(.horizontal, 15)
                                        .background(Color(hex: tags[tag]?.backgroundColor ?? "#000000"))
                                        .foregroundColor(Color(hex: tags[tag]?.rawValue ?? "#FFFFFF"))
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .frame(width: .infinity, alignment: .center)
            }

            HStack {
                Image(systemName: "person")
                    .font(.title)
                Text("Friends")
                    .font(.title)
            }
            VStack {
                ForEach(user.friends, id: \.id) { friend in
                    Text(friend.name)
                        .padding(15)
                        .foregroundColor(Color(hex: friendTags[friend.name]?.rawValue ?? "#FFFFFF"))
                        .background(Color(hex: friendTags[friend.name]?.backgroundColor ?? "#000000"))
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
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
