//
//  LikeViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/24/22.
//

import Foundation

final class LikeViewModel: ObservableObject{
    
    @Published var like = Like()
    @Published private(set) var state: SubmissionState?

    
    
    func onLikeClick(likeObject: Like){
        PostService.shared.onLikeClicked(likeObject: likeObject){[weak self]
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
    
    func onLikeDismiss(likeObject: Like){
        PostService.shared.onLikeDismissed(likeObject: likeObject){[weak self]
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

extension LikeViewModel{
    enum SubmissionState{
        case unsuccessful
        case successful
        case submitting
    }
}
