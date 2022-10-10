//
//  UserFilterViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/8/22.
//

import Foundation

enum UserFilterViewModel: Int, CaseIterable{
    case myPosts
    case likedPosts
    
    var title: String {
        switch self{
        case .myPosts: return "My Posts"
        case .likedPosts: return "Liked Posts"
        }
    }
}
