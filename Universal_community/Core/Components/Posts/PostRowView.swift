//
//  PostRowView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/7/22.
//

import SwiftUI

struct PostRowView: View {
    var body: some View {
        VStack (alignment: .leading){
            
            HStack(alignment: .top, spacing: 12){
                Circle()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(.systemBlue))
    
                //sets the text so that it aligns with the leading.
                VStack(alignment: .leading, spacing: 4){
                    //User info Nickname & user tag & date created;
                    HStack{
                        Text("Deokhyun Lee")
                            .font(.subheadline).bold()
                        Text("@Deok123")
                            .foregroundColor(.gray)
                            .font(.caption)
                        Text("2hrs")
                            .foregroundColor(.gray)
                            .font(.caption)
                    }
                    Text("I believe the best part of the life begins with believing the self.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                        
                }
            }
            //action buttons
            HStack{
                Button{
                    //action goes here...
                } label: {
                    Image(systemName: "bubble.left")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //action goes here...
                } label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //action goes here...
                } label: {
                    Image(systemName: "heart")
                        .font(.subheadline)
                }
                
                Spacer()
                
                Button{
                    //action goes here...
                } label: {
                    Image(systemName: "bookmark")
                        .font(.subheadline)
                }
            }
            .padding()
        }
        .padding()
    }
}

struct PostRowView_Previews: PreviewProvider {
    static var previews: some View {
        PostRowView()
    }
}
