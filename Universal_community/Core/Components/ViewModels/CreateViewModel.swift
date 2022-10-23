//
//  CreateViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/23/22.
//

import Foundation

final class CreateViewModel: ObservableObject{
    
    @Published var post = NewPost()
    @Published private(set) var state: SubmissionState?

    
    
    func createPost(memberId: Int64){
        PostService.shared.createPost(post: post, memberId: memberId){[weak self]
            (res) in
            DispatchQueue.main.async {
                self?.state = .submitting
                switch res{
                case .success():
                    self?.state = .successful
                case .failure(_):
                    self?.state = .unsuccessful
                }
            }
            // send back the data

        }
    }
}

extension CreateViewModel{
    enum SubmissionState{
        case unsuccessful
        case successful
        case submitting
    }
}
