//
//  PostItemView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/23/22.
//

import SwiftUI

struct PostItemView: View {
    
    var post: Post
    var body: some View {
        
        VStack(alignment: .leading){
            ScrollView{
                VStack(alignment: .leading){
                    userInfoView
                    Divider()
                    Text(post.title)
                        .font(.title)
                        .frame(maxHeight: 40)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 5)
                    
                    Divider()
                    Text(post.content)
                        .padding(.vertical, 5)
                        .padding(.horizontal, 10)
                    Divider()
                }
            }
        }
        .padding()
    }
    
    struct PostItemView_Previews: PreviewProvider {
        static var previews: some View {
            PostItemView(post: Post(id: 12, title: "hi", content: "demo placeholder http 1234 demo placeholder http 1234 demo", writer: "deok#0001", likeCount: 10, commentCount: 15, date: "sdad-asdasd-120", liked: true))
        }
    }
}

extension PostItemView{
    var userInfoView: some View{
            HStack{
                Text(post.writer)
                    .font(.subheadline).bold()
                Text("@\(post.id)")
                    .foregroundColor(.gray)
                    .font(.caption)
                Text("2hrs")
                    .foregroundColor(.gray)
                    .font(.caption)
            }
    }
}
