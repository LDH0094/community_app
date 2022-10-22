//
//  CreatePostView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/10/22.
//

import SwiftUI

struct CreatePostView: View {
    @State private var title = ""
    @State private var content = ""
    @State private var isLoading = true
    var memberId: Int64
    
    
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("취소")
                    
                }
                Spacer()
                
                Button{
                    Task{
                        PostService.shared.createPost(title: title, content: content, memberId: self.memberId){
                            (data, error) in
                            _ = data
                                presentationMode.wrappedValue.dismiss()
                        }
                    }
                    print(memberId)
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
            Divider()
            ScrollView{
              TextArea("제목 작성", text: $title)
                  .lineLimit(1)
                  .frame(maxHeight: 50)
                  .overlay(alignment: .topLeading){
                      Image(systemName: "message")
                          .offset(x: -16, y: 12)
                          .foregroundColor(Color(.placeholderText))
                  }.padding(.vertical, 5)
                  .padding(.horizontal, 40)
              
              Divider()
              TextArea("작성 하고 싶은 글이나\n나누고 싶은 말을 해보아요!", text: $content)
                  .padding(.vertical, 5)
                  .padding(.horizontal, 10)
            }
        }
        
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView(memberId: 0)
    }
}

