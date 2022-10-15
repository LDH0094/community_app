//
//  EditUserInfoView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/15/22.
//

import SwiftUI

struct EditUserInfoView: View {
    @State private var isShowingSheet: Bool = false
    @State private var isSecured: Bool = true
    @State private var userName: String = ""
    @State private var overlayColorUser = Color.clear
    
    var body: some View {
        Button{
            isShowingSheet.toggle()
        } label: {
            Text("정보 수정")
                .font(.subheadline).bold()
                .foregroundColor(.black)
                .frame(width: 120, height: 32)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
        }
        .sheet(isPresented: $isShowingSheet, onDismiss: didDismiss){
            bottomSheetLogin
            Spacer()
                .presentationDetents([.medium, .large])
        }
    }
    

    func didDismiss(){
        print("dismissed!!!!")
        //when dismissed
    }
}

struct EditUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        EditUserInfoView()
    }
}


extension EditUserInfoView {
    var bottomSheetLogin: some View {
        VStack(spacing: 12){
            TextField("사용할 닉네임", text: $userName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                .textContentType(.nickname)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(overlayColorUser, lineWidth: 0.75))
            
            HStack{
                Button("취소", action: { isShowingSheet.toggle()})
                
                Spacer()
                
                Button{
                    
                } label: {
                    Text("확인")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .foregroundColor(.white)
                        .background(Capsule().foregroundColor(.orange))
                }
            }
            .padding()
            
            
            
        }
        .padding(.vertical, 40)
        .padding(.horizontal, 12)
    }
}

