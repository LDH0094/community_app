//
//  FeedView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct FeedView: View {
    @State private var createPost = false
    @State private var shouldShowCreate = false
    @StateObject private var vm = FeedViewModel()
    @ObservedObject var userViewModel = UserInfoViewModel()
    @State var hasPosted: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack (alignment: .bottomTrailing){
                if vm.isLoading {
                    loadingView
                }else{
                    ScrollView {
                        LazyVStack(){
                            ForEach(vm.posts, id: \.id){
                                post in
                                PostRowView(post: post)
                                NavigationLink{
                                    PostItemView(id: post.id)
                                    
                                }label: {
                                    //something like this?
                                    EmptyView()
                                        .task{
                                            if vm.hasReachedEnd(of: post){
                                                await vm.getNextPosts()
                                            }
                                        }
                                }
                            }
                        }
                        .overlay(alignment: .bottom) {
                            if vm.isFetching {
                                ProgressView()
                            }
                        }
                        .padding()
                    }
                    .refreshable {
                        await vm.refreshPosts()
                    }
                }
                
            }
                .task {
                        await vm.getPosts()
                }
                .toolbar{
                    ToolbarItem(placement: .primaryAction){
                        createButton
                    }
                }
                .sheet(isPresented: $shouldShowCreate){
                    CreatePostView(memberId: 1)
                }
            }
        }
    }
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

extension FeedView {
        var createPostButton: some View {
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
                    //                            viewModel.refreshPosts()
                    hasPosted = false
                    print("on Dimiss: refreshing posts")
                }
            }){
                CreatePostView( memberId: userViewModel.user.memberId)
                
            }
        }
        
        var loadingView: some View {
            VStack{
                Spacer()
                ProgressView()
                Spacer()
                HStack{
                    Spacer()
                }
            }
        }
        
        var createButton: some View{
            Button{
                shouldShowCreate.toggle()
            }label: {
                Image(systemName: "square.and.pencil")
                    .font(.title2)
            }
            .disabled(vm.isLoading)
        }
    }
