//
//  UserService.swift
//  Universal_community
//
//  Created by 이덕현 on 10/15/22.
//

import Foundation


final public class UserService{
    
    public static let shared = UserService()
    
    //"http://localhost:8080/api/v1/member/1h2g2yysh297h2s"
    
    func signInUser(authId: String, nickname: String, completion: @escaping ([String: Any]?, Error?) -> Void){
        
        //declare parameter as a dictionary which contains string as key and value combination.
        let parameters = ["googleId": authId, "nickname": nickname]
        
        guard let url = URL(string: "http://localhost:8080/api/v1/member/1h2g2yysh297h2s") else {
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
              completion(nil, error)
          }
        
        //create dataTask using the session object to send data to the server
           let task = session.dataTask(with: request, completionHandler: { data, response, error in

               guard error == nil else {
                   completion(nil, error)
                   return
               }

               guard let data = data else {
                   completion(nil, NSError(domain: "dataNilError", code: -100001, userInfo: nil))
                   return
               }

               do {
                   //create json object from data
                   guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {
                       completion(nil, NSError(domain: "invalidJSONTypeError", code: -100009, userInfo: nil))
                       return
                   }
                   print(json)
                   completion(json, nil)
               } catch let error {
                   print(error.localizedDescription)
                   completion(nil, error)
               }
           })

           task.resume()
    
        
    }
}
