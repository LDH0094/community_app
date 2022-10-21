//
//  CreatePostViewModel.swift
//  Universal_community
//
//  Created by 이덕현 on 10/22/22.
//

import Foundation

class CreatePostViewModel: ObservableObject{
    @Published var isLoading: Bool = true
    
    func togle(){
        if (isLoading){
            isLoading = false
        }else{
            isLoading = true
        }
    }
}
