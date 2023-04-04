//
//  ApiController.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import Foundation

struct ApiController {
    
    func fetchUsers() async -> [User] {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedUsers = try? decoder.decode([User].self, from: data) {
                return decodedUsers
            }
        } catch {
            print("Error while fetching the data")
            return []
        }
        
        
        
        return []
    }
    
}
