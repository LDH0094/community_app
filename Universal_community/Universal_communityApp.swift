//
//  Universal_communityApp.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

@main
struct Universal_communityApp: App {

    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: "4517fbf3b2c336f9f4647ed53d7a9029")
        
        print("hi!")
    }
    
    var body: some Scene {
        WindowGroup {
            MainTabView().onOpenURL(perform: { url in
                if (AuthApi.isKakaoTalkLoginUrl(url)){
                    AuthController.handleOpenUrl(url: url)
                }
            })
        }
    }
}
