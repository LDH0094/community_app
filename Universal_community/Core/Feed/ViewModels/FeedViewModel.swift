//
//  FeedViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published  var posts = [Post]()
    @Published  var hasPosts: Bool = false
    let service = PostService.shared
    @Published  var isLoading = false

    init() {
        getPosts()
    }
    func getPosts(){
        print("loading..")
        isLoading = true
        service.fetchPosts() { postData in
            if (postData.data.isEmpty){
                self.hasPosts = false
            }else{
                self.hasPosts = true
                //from general post data to posts [post]
                self.posts = postData.data
            }
        }
        isLoading = false
        print("loading done..")
    }
    
    func refreshPosts(){
        isLoading = true
        service.fetchPosts() { postData in
            if (postData.data.isEmpty){
                self.hasPosts = false
            }else{
                self.hasPosts = true
                //from general post data to posts [post]
                self.posts.append(contentsOf: postData.data)
                
            }
        }
        isLoading = false
    }
    
    /*
     when post is initiall called.
     */
    
}

