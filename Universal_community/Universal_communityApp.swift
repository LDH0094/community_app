//
//  Universal_communityApp.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI
import GoogleSignIn

@main
struct Universal_communityApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
//            ProfileView(user: User(googleId: "132", nickname: "deok#0001"))
        }
    }
}
