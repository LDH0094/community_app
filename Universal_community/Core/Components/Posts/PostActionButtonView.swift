//
//  PostActionButtonView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/24/22.
//

import SwiftUI

struct PostActionButtonView: View {
    let post: Post
    var body: some View {
        //action buttons
        Text("hello")
    }
}

struct PostActionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PostActionButtonView (post: Post(id: 12, title: "hi", content: "demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234  ", writer: "deok#0001", likeCount: 10, commentCount: 15, date: "sdad-asdasd-120", liked: true))
    }
}
