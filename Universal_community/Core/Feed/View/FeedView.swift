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
                    scrollPost
                }
                createButton
                    .padding()
            }
        
            .task {
                await vm.getPosts()
            }
            .sheet(isPresented: $shouldShowCreate){
                CreatePostView(memberId: memberId)
            }
        }
    }
    
    struct FeedView_Previews: PreviewProvider {
        static var previews: some View {
            FeedView()
        }
    }
}
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
                memberId = Int64(UserDefaults.standard.integer(forKey: "memberId"))
                print("Now MemberId: \(memberId)")
                if memberId == 0{
                    // code to show alert
                }else{
                    shouldShowCreate.toggle()
                }
            }label: {
                Image(systemName: "square.and.pencil.circle.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.mint)
            }
            .disabled(vm.isLoading || vm.isFetching)
        }
        
    
    
        var scrollPost: some View {
            ScrollView {
                LazyVStack(){
                    ForEach(vm.posts, id: \.id){
                        post in
                        
                        NavigationLink{
                            PostItemView(post: post)
                                .navigationBarBackButtonHidden(false)
                            
                        }label: {
                            //something like this?
                            PostRowView(post: post, memberId: memberId)
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

