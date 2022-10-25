//
//  FeedView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct FeedView: View {
    @StateObject private var vm = FeedViewModel()
    @State private var createPost = false
    @State private var shouldShowCreate = false
    @State var hasPosted: Bool = false
    @State var memberId: Int64 = 0
    @State var hasLoggedIn: Bool = false
    
    var body: some View {
        NavigationView{
            ZStack (alignment: .bottomTrailing){
                if vm.isLoading{
                    loadingView
                }else{
                    scrollPost
                }
                createButton
                    .padding()
            }
            .task {
                memberId = Int64(UserDefaults.standard.integer(forKey: "memberId"))
                hasLoggedIn = UserDefaults.standard.bool(forKey: "hasLoggedIn")
                await vm.getPosts(memberId: String(memberId))
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
                                    if (vm.hasReachedEnd(of: post) && !vm.hasNoData){
                                        await vm.getNextPosts(memberId: String(memberId))
                                    }
                                }
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
                .overlay(alignment: .bottom) {
                    if vm.isFetching && !vm.hasNoData{
                        ProgressView()
                    }
                    if vm.hasNoData {
                        Text("더이상 불러들일 게시글이 없습니다")
                    }
                }
                .padding()
            }
            .refreshable {
                await vm.refreshPosts(memberId: String(memberId))
            }
        }
    }

