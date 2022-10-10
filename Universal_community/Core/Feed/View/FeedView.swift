//
//  FeedView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct FeedView: View {

    
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
            
                NavigationLink(destination: CreatePostView()){
                    Image(systemName: "square.and.pencil.circle.fill")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.orange)
                        .frame(width: 60, height: 60)
                        .padding()
                }
                .navigationTitle(Text(""))
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
