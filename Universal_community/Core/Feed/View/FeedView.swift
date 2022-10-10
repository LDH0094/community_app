//
//  FeedView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct FeedView: View {
    @State private var createPost = false
    
    var body: some View {
        NavigationView{
            ZStack (alignment: .bottomTrailing){
                ScrollView {
                    LazyVStack{
                        ForEach(0 ... 20, id: \.self){
                            _ in PostRowView()
                            
                        }
                    }
                }
            
                Button{
                    createPost.toggle()
                }label:
                {
                    Image(systemName: "square.and.pencil.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.orange)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                .fullScreenCover(isPresented: $createPost){
                    CreatePostView()
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
