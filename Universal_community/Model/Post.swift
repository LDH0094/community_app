//
//  Post.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation



struct PostData: Codable {
    let status: Int
    let msg: String
    let data: [Post]
}

struct Post: Codable, Hashable{
    let id: Int
    let title, content, writer: String
    var likeCount, commentCount: Int
    let date: String
    let liked: Bool
}

