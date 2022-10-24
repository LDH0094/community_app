//
//  Like.swift
//  Universal_community
//
//  Created by 이덕현 on 10/24/22.
//

import Foundation


struct Like: Codable{
    var postId: String = ""
    var memberId: String = ""
    var liked: Bool = false
    var likeCnt: Int = 0
}
