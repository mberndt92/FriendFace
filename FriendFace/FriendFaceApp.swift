//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import SwiftUI

@main
struct FriendFaceApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
