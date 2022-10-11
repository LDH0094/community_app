//
//  FeedViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation

class FeedViewModel: ObservableObject{
    @Published var posts = [Post]()
    let service = PostService()
    
    init(){
        getPosts()
    }
    
    func getPosts(lastIndex: Int){
        service.fetchPosts(lastIndex: lastIndex) { postData in
            
            //from general post data to posts [post]
            self.posts = postData.data
        }
    }
    
    /*
     when post is initiall called.
     */
    func getPosts(){
        service.fetchPosts(lastIndex: 0) { postData in
            
            //from general post data to posts [post]
            self.posts = postData.data
        }
    }
    
    
}

