//
//  UserInfoViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/18/22.
//

import Foundation
import KakaoSDKUser

class UserInfoViewModel: ObservableObject{
    @Published var user: User = User(authId: "", nickname: "로그인하기", memberId: 0)
    @Published var hasLoggedIn: Bool = false
//    @Published var isLoading: Bool = true
    
    init() {
        hasLoggedIn = UserDefaults.standard.bool(forKey: "hasLoggedIn")
        if (hasLoggedIn){
        var authId: String = UserDefaults.standard.string(forKey: "authId") ?? ""
        var nickname: String = UserDefaults.standard.string(forKey: "nickname") ?? "ERROR 102"
            var memberId: Int64 = Int64(UserDefaults.standard.integer(forKey: "memberId"))
            self.user = User(authId: authId, nickname: nickname, memberId: memberId)
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
                UserDefaults.standard.set(self.user.authId, forKey: "authId")
                UserDefaults.standard.set(self.user.nickname, forKey: "nickname")
                UserDefaults.standard.set(true, forKey: "hasLoggedIn")
                UserService.shared.signInUser(authId: self.user.authId, nickname: self.user.nickname){
                    (data,error) in
                    print("memberId: \(data?["id"]) has been added")
                    UserDefaults.standard.set(data?["id"] ?? 1, forKey: "memberId")
                    self.user = User(authId: String(user?.id ?? 0), nickname: user?.kakaoAccount?.profile?.nickname ?? "Error: 101", memberId: data!["id"] as! Int64 )
                   
                }
                self.hasLoggedIn = true
            }
        }
    }
    
    func testLogIn(authId: String , nickname: String){
        UserDefaults.standard.set(authId, forKey: "authId")
        UserDefaults.standard.set(nickname, forKey: "nickname")
        UserDefaults.standard.set(true, forKey: "hasLoggedIn")
                UserService.shared.signInUser(authId: authId, nickname: nickname){
                    (data,error) in
                    print("memberId: \(data?["id"]) has been added")
                    UserDefaults.standard.set(data?["id"] ?? 0, forKey: "memberId")
                    self.user = User(authId: authId, nickname: nickname,  memberId: data!["id"] as! Int64)
                    
                }
                self.hasLoggedIn = true
            }
    
    func logOut(){
        UserDefaults.resetStandardUserDefaults()
        UserDefaults.standard.set(false, forKey: "hasLoggedIn")
        user = User(authId: "", nickname: "로그인하기", memberId: 0)
        self.hasLoggedIn = false
    }
    
}
