//
//  PostRowView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct PostRowView: View {
    @StateObject private var vm = LikeViewModel()
    @State var isLiked: Bool
    @State var likeCnt: Int
    @State var submitStatus: Bool = false
    let post: Post
    var memberId: Int64
    
    init(post: Post, memberId: Int64?) {
        self.post = post
        isLiked = post.liked
        likeCnt = post.likeCount
        self.memberId = memberId ?? 0
    }
    
    var body: some View {

        VStack (alignment: .leading){
            
            HStack(alignment: .top, spacing: 12){
//                Circle()
//                    .frame(width: 56, height: 56)
//                    .foregroundColor(Color(.systemBlue))
    
                //sets the text so that it aligns with the leading.
                VStack(alignment: .leading, spacing: 4){
                    //User info Nickname & user tag & date created;
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
                    if (memberId != 0){
                        // like is not clicked
                        if !isLiked {
                            isLiked = true
                            likeCnt += 1
                            Task{
                                vm.onLikeClick(likeObject: Like(postId: String(post.id), memberId: String(memberId)))
                                
                                if submitStatus {
                                    print("Like Button: \(post.id) / Clicked")
                                }
                            }
                        // if like is clicked already,
                        } else {
                            isLiked = false
                            likeCnt += 1
                            Task{
                                vm.onLikeDismiss(likeObject: Like(postId: String(post.id), memberId: String(memberId)))
                                
                                if submitStatus {
                                    print("Like Button: \(post.id) / Dismissed")
                                }
                            }
                        }
                    } else {
                        print("need to login first to post like!")
                    }
                } label: {
                    isLiked ?
                    Image(systemName: "heart.fill")
                        .font(.subheadline)
                    :
                    Image(systemName: "heart")
                        .font(.subheadline)
                    
                }.onChange(of: vm.state){ stateValue in
                        if stateValue == .successful{
                            submitStatus = true
                        }
                }
                
                Text("\(likeCnt) Likes")
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
        PostRowView(post: Post(id: 12, title: "hi", content: "demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234 demo placeholder http 1234  ", writer: "deok#0001", likeCount: 10, commentCount: 15, date: "sdad-asdasd-120", liked: true), memberId: 0)
    }
}
