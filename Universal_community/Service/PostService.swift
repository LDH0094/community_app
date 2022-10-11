//
//  PostService.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation


struct PostService {
//    "localhost:8080/api/v1/board/\(lastIndex)"
    static let shared = PostService()
    
    
    func fetchPosts(lastIndex: Int, completion: @escaping (PostData) -> () ){
        
        guard let url = URL(string: "localhost:8080/api/v1/board/\(lastIndex)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, _, _) in
            let postData = try! JSONDecoder().decode(PostData.self, from: data!)
            
            DispatchQueue.main.async {
                completion(postData)
            }
        }.resume()
    }
}
