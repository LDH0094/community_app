//
//  FeedViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published private(set) var posts: [Post] = []
    @Published private(set) var likedPosts: [Post] = []
    @Published private(set) var hasPosts: Bool = false
    @Published private(set) var viewState: ViewState?
    @Published var hasError = false
    private var memberId = "0"

    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fethcing
    }
    
    private var lastIndex = 10
    private var page = 0
    

    func getPosts() async {
        print("------------getting posts---------------")
        print("loading..")
        
        if (posts.isEmpty){
            viewState = .loading
        }
        
        else{
            viewState = .fethcing
        }
        
        memberId = String(UserDefaults.standard.integer(forKey: "memberId"))
        
        defer{ viewState = .finished}
        PostService.shared.fetchPosts(pageId: 0, memberId: memberId){ postData in
            if (postData.data.isEmpty){
            }else{
                //from general post data to posts [post]
                self.lastIndex = postData.data.count
                self.posts = postData.data
            }
        }
        print("loading done..")
    }
    
    func getNextPosts() async {
        print("loading..")
        viewState = .fethcing
        defer{ viewState = .finished}
        
        page += 1
        
        memberId = String(UserDefaults.standard.integer(forKey: "memberId"))
        
        PostService.shared.fetchPosts(pageId: page, memberId: memberId) { postData in
            if (postData.data.isEmpty){
            }else{
                //from general post data to posts [post]
                self.posts += postData.data
            }
        }

        print("loading done..")
    }
    
    func hasReachedEnd(of post: Post) -> Bool {
        print("last id: \(posts.last?.id)")
        print("post id: \(post.id)")
        if (post.id == 1){
            return false
        }
        if (posts.last?.id == post.id){
            return true
        } else{
            return false
        }
    }
    
    func refreshPosts() async {
        print("refreshed")
        memberId = String(UserDefaults.standard.integer(forKey: "memberId"))
        PostService.shared.fetchPosts(pageId: 0, memberId: memberId) { postData in
            if (postData.data.isEmpty){
                print("nothing to bring")
            }else{
                //from general post data to posts [post]
                self.posts.insert(contentsOf: postData.data, at: 0)

            }
        }
    }
    
}

extension FeedViewModel{
    enum ViewState{
        case fethcing
        case loading
        case finished
    }
}
//private extension FeedViewModel {
//    func reset() {
//        if viewState == .finished {
//            posts.removeAll()
//            page = 0
//            viewState = nil
//        }
//    }
//}
