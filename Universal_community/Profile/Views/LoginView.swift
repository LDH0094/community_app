//
//  LoginView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View {
    let googleApi: GoogleAPI = GoogleAPI()
    var body: some View {
        GoogleSignInButton(action: googleApi.signIn)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


