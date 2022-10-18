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

    
    var body: some View {
        NavigationView{
            ZStack (alignment: .bottomTrailing){
                ScrollView {
                    LazyVStack{
//                        ForEach(viewModel.posts, id: \.self){
//                            post in PostRowView(post: post)
//                            
//                        }
                    }
                    
                }
                Button{
                    if (!userViewModel.user.authId.isEmpty){
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
                    CreatePostView(authId: userViewModel.user.authId)
                        
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


