//
//  KakaoLoginView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/15/22.
//

import SwiftUI

struct KakaoLoginView: View {
    private var kakao = KakaoApi()
    var body: some View {
        Button{
//            kakao.deleteAccount()
            kakao.kakaoWebLogin()
//            kakao.kakaoLogOut()
        } label: {
            Image("kakao_login_medium_narrow")
        }
    }
    
}

struct KakaoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        KakaoLoginView()
    }
}
