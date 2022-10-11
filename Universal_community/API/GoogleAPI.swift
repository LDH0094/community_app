//
//  GoogleApi.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation
import GoogleSignIn

class GoogleAPI{
    let shared = GoogleAPI()
    
    let signInConfig = GIDConfiguration(clientID: "500223729983-ebka93bdkeqo3gl920i624u0aanfpnqq.apps.googleusercontent.com")
    
    func signIn(){

       guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}

      
          GIDSignIn.sharedInstance.signIn(
            with: signInConfig,
            presenting: presentingViewController) { user, error in
              guard let signInUser = user else {
                // Inspect error
                return
              }
              // If sign in succeeded, display the app's main content View.
                print(signInUser)
            }
    }
}
