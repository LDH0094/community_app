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
                    .onOpenURL { url in
                      GIDSignIn.sharedInstance.handle(url)
                    }
                    .onAppear {
                        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                            // Check if `user` exists; otherwise, do something with `error`
                        }
                    }
                }
        }
    }
