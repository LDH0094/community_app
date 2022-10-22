//
//  LoginView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/20/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var userViewModel = UserInfoViewModel()
    var body: some View {
        if (userViewModel.hasLoggedIn){
            ProfileView()
        }else{
            VStack{
                actionButtons
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView{
    var actionButtons: some View {
        VStack{
            Button{
                userViewModel.logIn()
            } label: {
                Image("kakao_login_medium_narrow")
            }
            Button("LogmeIn"){
                userViewModel.testLogIn(authId: "1022", nickname: "Lee")
            }
        }
    }
}
