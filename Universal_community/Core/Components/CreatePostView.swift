//
//  CreatePostView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/10/22.
//

import SwiftUI

struct CreatePostView: View {
    @State private var caption = "안녕하세요 샘플 글입니다"
    var body: some View {
        VStack{
            HStack{
                Button{
                    
                } label: {
                    Text("취소")
                    
                }
                Spacer()
                
                Button{
                    
                } label: {
                    Text("작성하기")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Capsule().foregroundColor(.orange))
                }
            }
            .padding()
            TextArea(text: $caption, "적고 싶은 내용을 적어봐요!")
            Spacer()
        }
        
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
