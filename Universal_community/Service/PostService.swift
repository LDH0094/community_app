//
//  PostService.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation


struct PostService {
//localhost:8080/api/v1/posts/list/1?page=0&size=10
    static let shared = PostService()
    
    
    func fetchPosts(completion: @escaping (PostData) -> () ){
        
        guard let url = URL(string: "http://localhost:8080/api/v1/posts/list/1?page=0&size=10") else {
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, _, _) in
            print(data!)
            let postData = try! JSONDecoder().decode(PostData.self, from: data!)
            
            
            DispatchQueue.main.async {
                completion(postData)
            }
        }.resume()
    }
}
