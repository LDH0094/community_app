//
//  PostService.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import Foundation


final public class PostService {
    public static let shared = PostService()
    
    // "http://localhost:8080/api/v1/posts/list/1?page=0&size=10"
    
    func fetchPosts(pageId: Int, completion: @escaping (PostData) -> () ){
        guard let url = URL(string: "http://localhost:8080/api/v1/posts/list/0?page=\(pageId)&size=10") else {
            return
        }
        sleep(3)
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) {(data, _, _) in
            
            guard let data = data else {
                return
            }
            guard let postData = try? JSONDecoder().decode(PostData.self, from: data) else{
                return
            }
            DispatchQueue.main.async {
                completion(postData)
            }
        }.resume()
    }
    
    
    
    
    //"http://localhost:8080/api/v1/posts/"
    
    func createPost(post: NewPost, memberId: Int64, completion: @escaping (Result<Void, Error>) -> Void){
        
        //declare parameter as a dictionary which contains string as key and value combination.
        let parameters = ["title": post.title, "content": post.content, "memberId": memberId] as [String : Any]
        
        guard let url = URL(string: "http://localhost:8080/api/v1/posts/") else {
            return
        }
        
        var request: URLRequest = URLRequest(url: url)
        //create the session object
          let session = URLSession.shared
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
              request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to data object and set it as request body
          } catch let error {
              print(error.localizedDescription)
              completion(.failure(error))
          }
        
        //create dataTask using the session object to send data to the server
           let task = session.dataTask(with: request, completionHandler: { data, response, error in
//
//               guard error == nil else {
//                   completion(.failure())
//                   return
//               }

               guard let data = data else {
                   completion(.failure(NSError(domain: "dataNilError", code: -100001, userInfo: nil)))
                   return
               }

               do {
                   print("serial: \(data)")
                   //create json object from data
                   guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                       completion(.failure( NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil)))
                       return
                   }
                   
                   print(json)
                   completion(.success(()))
               } catch let error {
                   print(error.localizedDescription)
                   completion(.failure(error))
               }
           })

           task.resume()
    
        
    }
}
