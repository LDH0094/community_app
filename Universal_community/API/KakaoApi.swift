//
//  KakaoApi.swift
//  Universal_community
//
//  Created by 이덕현 on 10/15/22.
//

import Foundation
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

final public class KakaoApi{
    public static let shared = KakaoApi()
    
    
    public func webLogIn() {
         UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                    UserDefaults.standard.set(false, forKey: "hasLoggedIn")
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    //do something
                    UserDefaults.standard.set(true, forKey: "hasLoggedIn")
                    _ = oauthToken
                }
            }
    }
    
    public func checkLogIn() async {
        if (AuthApi.hasToken()){
            UserApi.shared.accessTokenInfo { (_, error) in
                if let error = error {
                    if let sdkError = error as? SdkError, sdkError.isInvalidTokenError() == true  {
                        //로그인 필요
                        
                        
                    }
                    else {
                        //기타 에러
                        
                    }
                }
                else {
                    //토큰 유효성 체크 성공(필요 시 토큰 갱신됨)
                    
                }
            }
        }
        else {
            //로그인 필요
            
        }
    }

}
