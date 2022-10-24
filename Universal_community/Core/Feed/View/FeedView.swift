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
    @State var memberId: Int64

    
    init() {
        memberId = Int64(UserDefaults.standard.integer(forKey: "memberId"))
    }
    
    
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
                    memberId = Int64(UserDefaults.standard.integer(forKey: "memberId"))
                    print("Now MemberId: \(memberId)")
                        await vm.getPosts()
                }
                .toolbar{
                    if(memberId != 0){
                        ToolbarItem(placement: .primaryAction){
                            createButton
                        }}
                }
                .sheet(isPresented: $shouldShowCreate){
                    CreatePostView(memberId: memberId)
                }
            }
        }
    }
//struct FeedView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeedView(memberId: Int64(UserDefaults.standard.integer(forKey: "memberId")))
//    }
//}

extension FeedView {
        
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
