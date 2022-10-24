//
//  CreatePostView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/10/22.
//

import SwiftUI

struct CreatePostView: View {
    @State private var isLoading = true
    @State private var onSubmit: Bool = false
    @StateObject private var vm = CreateViewModel()
    @FocusState private var focusedField: Field?
    enum Field: Hashable {
       case title, content
     }
    
    var memberId: Int64
    
    
    
    @Environment(\.dismiss) private var dismiss
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    dismiss()
                } label: {
                    Text("취소")
                    
                }
                Spacer()
                
                Button{
                    focusedField = nil
                    Task{
                        vm.createPost(memberId: self.memberId)
                    }
                    
                } label: {
                    Text("작성하기")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Capsule().foregroundColor(.orange))
                }
                
            }
            .overlay {
                if vm.state == .submitting {
                    ProgressView()
                }
            }
            .padding()
            Divider()
            ScrollView{
                TextArea("제목 작성", text: $vm.post.title)
                    .focused($focusedField, equals: .title)
                  .lineLimit(1)
                  .frame(maxHeight: 50)
                  .overlay(alignment: .topLeading){
                      Image(systemName: "message")
                          .offset(x: -16, y: 12)
                          .foregroundColor(Color(.placeholderText))
                  }.padding(.vertical, 5)
                  .padding(.horizontal, 40)
              
              Divider()
                TextArea("작성 하고 싶은 글이나\n나누고 싶은 말을 해보아요!", text: $vm.post.content)
                    .focused($focusedField, equals: .content)
                  .padding(.vertical, 5)
                  .padding(.horizontal, 10)
            }
        }.onChange(of: vm.state){ formState in
            if formState == .successful{
                dismiss()
            }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView(memberId: 0)
    }
}

