//
//  PostRowView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct PostRowView: View {
    let post: Post
    var body: some View {

        VStack (alignment: .leading){
            
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
    
                //sets the text so that it aligns with the leading.
                VStack(alignment: .leading, spacing: 4){
                    //User info Nickname & user tag & date created;
                    HStack{
                        Text(post.writer)
                            .font(.subheadline).bold()
                        Text("@\(post.writer)")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2hrs")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Text(post.content)
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        
                }
            }
            
            //action buttons
            HStack{
                Button{
                    //action goes here...
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Text(String(post.commentCount))
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer(minLength: 5)
                
                Button{
                    //action goes here...
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Text("\(post.likeCount) Likes")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            
                Spacer()
                

            }
            .padding()
            .foregroundColor(.red)
            Divider()
            
        }
        .padding()
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView(post: Post(id: 12, title: "hi", content: "demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234  ", writer: "deok#0001", likeCount: 10, commentCount: 15, date: "sdad-asdasd-120", liked: true))
    }
}
