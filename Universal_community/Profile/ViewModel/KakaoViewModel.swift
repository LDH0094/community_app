//
//  KakaoViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/15/22.
//

import Foundation

class KakaoViewModel: ObservableObject{
    @Published var isLoggedIn: Bool = false
    var service = KakaoApi()
    
    init() {
        service.kakaoAccessTokenInfo()
        return isLoggedIn
    }
    
    func checkLogIn(){
        service.kakaoAccessTokenInfo()
    }
}
