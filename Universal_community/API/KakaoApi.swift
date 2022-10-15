//
//  KakaoApi.swift
//  Universal_community
//
//  Created by 이덕현 on 10/15/22.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class KakaoApi{
    var isLoggedIn: Bool = false
    
    func kakaoLogIn(){
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    //do something
                    _ = oauthToken
                }
            }
        }
    }
    
    func kakaoWebLogIn(){
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    self.isLoggedIn = true
                    //do something
                    _ = oauthToken
                }
            }
    }
    
    func kakaoLogOut(){
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("logout() success.")
            }
        }
    }
    
    func deleteAccount(){
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("unlink() success.")
            }
        }
    }
    
    func kakaoUserInfo(){
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                //do something
                _ = user
            }
        }
    }
    
    
    func checkLogIn(){
        // 사용자 액세스 토큰 정보 조회
        UserApi.shared.accessTokenInfo {(accessTokenInfo, error)  in
            if let error = error{
                print(error)
                self.isLoggedIn = false
            }
            else {
                print("accessTokenInfo() success.")
                //do something
                _ = accessTokenInfo
                self.isLoggedIn = true
            }
        }
    }

}
