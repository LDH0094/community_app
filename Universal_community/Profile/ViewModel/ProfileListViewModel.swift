//
//  ProfileListViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/24/22.
//

import Foundation


class ProfileListViewModel: ObservableObject {
    @Published private(set) var likedPosts: [Post] = []
    @Published private(set) var hasPosts: Bool = false
    @Published private(set) var viewState: ViewState?
    @Published var hasError = false
    private var memberId = "0"
    private var lastIndex = 10
    private var page = 0
    
    var isLoading: Bool {
        viewState == .loading
    }
    
    var isFetching: Bool {
        viewState == .fethcing
    }
    
    
    
    /*
     in case of liked posts
     */
    
    func getLikedPosts() async {
        print("------------getting  liked posts---------------")
        print("loading..")
        
        if (likedPosts.isEmpty){
            viewState = .loading
        }
        
        else{
            viewState = .fethcing
        }
        
        memberId = String(UserDefaults.standard.integer(forKey: "memberId"))
        
        defer{ viewState = .finished}
        PostService.shared.fetchLikedPosts(pageId: 0, memberId: memberId){ postData in
            if (postData.data.isEmpty){
            }else{
                //from general post data to posts [post]
                self.lastIndex = postData.data.count
                self.likedPosts = postData.data
            }
        }
        print("loading done..")
    }
    
    func refreshLikedPosts() async {
        print("refreshed liked")
        memberId = String(UserDefaults.standard.integer(forKey: "memberId"))
        PostService.shared.fetchLikedPosts(pageId: 0, memberId: memberId) { postData in
            if (postData.data.isEmpty){
                print("nothing to bring")
            }else{
                //from general post data to posts [post]
                self.likedPosts.insert(contentsOf: postData.data, at: 0)

            }
        }
    }
   
    
}

extension ProfileListViewModel{
    enum ViewState{
        case fethcing
        case loading
        case finished
    }
}

