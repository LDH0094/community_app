//
//  FeedView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        
        ScrollView {
            LazyVStack{
                ForEach(0 ... 20, id: \.self){
                    _ in PostRowView()
                
                }
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
