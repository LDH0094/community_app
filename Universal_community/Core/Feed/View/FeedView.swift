//
//  FeedView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct FeedView: View {
    @State private var createPost = false
    @StateObject private var viewModel = FeedViewModel()
    @ObservedObject var userViewModel = UserInfoViewModel()
    @State var hasPosted: Bool = false

   

    var body: some View {
            ZStack (alignment: .bottomTrailing){
                Group{
                    if (viewModel.isLoading){
                        VStack{
                            Spacer()
                            ProgressView()
                                .onAppear{
                                    print("spinner am I?")
                                }
                            Spacer()
                        }
                    }else{
                        ScrollView {
                            LazyVStack{
                                ForEach(viewModel.posts, id: \.self){
                                    post in
                                    PostRowView(post: post)
                                }
                            }
                        }
                        }
                    }
                    Button{
                        if (userViewModel.user.memberId != 0){
                            createPost.toggle()
                        } else {
                            //show alert below
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
                    .fullScreenCover(isPresented: $createPost, onDismiss: {
                        if(hasPosted) {
                            viewModel.refreshPosts()
                            hasPosted = false
                            print("on Dimiss: refreshing posts")
                        }
                    }){
                        CreatePostView(hasPosted: $hasPosted, memberId: userViewModel.user.memberId)
                        
                    }
                }
            }
    }
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
        }
    }
    
    

