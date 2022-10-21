//
//  FeedView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct FeedView: View {
    @State private var createPost = false
    @ObservedObject var viewModel = FeedViewModel()
    @ObservedObject var userViewModel = UserInfoViewModel()
    
    init(){
        viewModel.getPosts()
    }
    
    var body: some View {
        NavigationView{
            ZStack (alignment: .bottomTrailing){
                Group{
                    if (viewModel.hasPosts){
                        ScrollView {
                            LazyVStack{
                                ForEach(viewModel.posts, id: \.self){
                                    post in
                                    PostRowView(post: post)
                                    
                                }
                            }
                        }
                    } else{
                        Text("보여드릴 게시글이 없어요!")
                    }
                    Button{
                        if (userViewModel.user.memberId != 0){
                            createPost.toggle()
                        } else {
                            print("Need to Login to Post")
                        }
                    }label:
                    {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.orange)
                            .frame(width: 60, height: 60)
                            .padding()
                    }
                    .fullScreenCover(isPresented: $createPost){
                        CreatePostView(memberId: userViewModel.user.memberId)
                        
                    }
                }
            }
        }
    }
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
        }
    }
    
    
}
