//
//  UserInfoViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/18/22.
//

import Foundation
import KakaoSDKUser

class UserInfoViewModel: ObservableObject{
    @Published var user: User = User(authId: "", nickname: "로그인하기")
    @Published var hasLoggedIn: Bool = false
    
    init() {
        hasLoggedIn = UserDefaults.standard.bool(forKey: "hasLoggedIn")
        if (hasLoggedIn){
        var authId: String = UserDefaults.standard.string(forKey: "authId") ?? ""
        var nickname: String = UserDefaults.standard.string(forKey: "nickname") ?? "ERROR 102"
            self.user = User(authId: authId, nickname: nickname)
        }
    }
    
    func logIn(){
        KakaoApi.shared.webLogIn()
        //save the user data in UserDefault. id and nickname
        UserApi.shared.me() {(user, error) in
            if let error = error {
                print(error)
            }
            else {
                print("me() success.")
                
                //do something
                _ = user
                self.user = User(authId: String(user?.id ?? 0), nickname: user?.kakaoAccount?.profile?.nickname ?? "Error: 101")
                UserDefaults.standard.set(self.user.authId, forKey: "authId")
                UserDefaults.standard.set(self.user.nickname, forKey: "nickname")
                UserDefaults.standard.set(true, forKey: "hasLoggedIn")
                UserService.shared.signInUser(authId: self.user.authId, nickname: self.user.nickname){
                    (data,error) in
                    _ = data
                   print(data)
                   
                }
                self.hasLoggedIn = true
            }
        }
    }
    
    func logOut(){
        UserDefaults.resetStandardUserDefaults()
        UserDefaults.standard.set(false, forKey: "hasLoggedIn")
        user = User(authId: "", nickname: "로그인하기")
        self.hasLoggedIn = false
    }
    
}
