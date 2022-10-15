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
    }
   
    var body: some View {
        Button("logout"){
            service.kakaoWebLogIn()
        }
//        Group{
//            if (loginStat){
//                HStack{
//                    EditUserInfoView()
//                    Button{
//                        service.kakaoLogOut()
//                        if (service.isLoggedOut){
//                            loginStat.toggle()
//                        } else {
//                            //loggin out failed, keep logged in
//                            loginStat = true
//                        }
//                    } label: {
//                        Text("로그아웃")
//                            .font(.subheadline)
//                            .foregroundColor(.red)
//                    }
//                }
//            } else {
//                Button{
//                    service.kakaoWebLogIn()
//                    if (service.isLoggedIn){
//                        loginStat.toggle()
//
//                    } else {
//
//                        //signing failed, keep login button appear
//                        loginStat = false
//                        print("KakaoLoginView: Login failed")
//                    }
//                } label: {
//                    Image("kakao_login_medium_narrow")
//                }
//            }
//        }
        
    }
    struct KakaoLoginView_Previews: PreviewProvider {
        static var previews: some View {
            KakaoLoginView()
        }
    }
}
