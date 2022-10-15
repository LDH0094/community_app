//
//  KakaoLoginView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/15/22.
//

import SwiftUI
import KakaoSDKUser

struct KakaoLoginView: View {
    private var service: KakaoApi
    @State var loginStat: Bool
    
    init() {
        service = KakaoApi()
        loginStat = service.isLoggedIn
        print("init call")
    }
   
    var body: some View {
        Group{
            if (loginStat){
                EditUserInfoView()
            } else {
                Button{
                    service.kakaoWebLogIn()
                    if (service.isLoggedIn){
                        loginStat.toggle()
                    } else {
                        loginStat = false
                    }
                } label: {
                    Image("kakao_login_medium_narrow")
                }
            }
        }
        
    }
    struct KakaoLoginView_Previews: PreviewProvider {
        static var previews: some View {
            KakaoLoginView()
        }
    }
}
