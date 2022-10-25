//
//  UserViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/25/22.
//

import Foundation


class UserViewModel: ObservableObject{
    @Published var user: User = User(authId: "", nickname: "로그인을 해 주세요!", memberId: 0)
    @Published var hasLoggedIn: Bool = false
    
    init() {
        hasLoggedIn = UserDefaults.standard.bool(forKey: "hasLoggedIn")
        if (hasLoggedIn){
        let authId: String = UserDefaults.standard.string(forKey: "authId") ?? ""
        let nickname: String = UserDefaults.standard.string(forKey: "nickname") ?? "ERROR 102"
        let memberId: Int64 = Int64(UserDefaults.standard.integer(forKey: "memberId"))
            self.user = User(authId: authId, nickname: nickname, memberId: memberId)
        }
    }
    
}
