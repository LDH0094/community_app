//
//  LoginView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/11/22.
//

import SwiftUI


struct LoginView: View {
    @State private var isShowingSheet: Bool = false
    @State private var isSecured: Bool = true
    @State private var userName: String = ""
    @State private var password: String = ""
    @State private var overlayColorUser = Color.clear
    @State private var overlayColorPassword = Color.clear
    var body: some View{
        Button{
            isShowingSheet.toggle()
        } label: {
            Text("로그인 하기")
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

extension LoginView {
    var bottomSheetLogin: some View {
        VStack(spacing: 12){
            TextField("사용할 닉네임", text: $userName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10.0)
                .textContentType(.nickname)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(overlayColorUser, lineWidth: 0.75))
            ZStack(alignment: .trailing){
                Group{
                    if isSecured {
                        SecureField("사용할 비밀번호", text: $password)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10.0)
                            .textContentType(.password)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(overlayColorPassword, lineWidth: 0.75))
                    }else{
                        TextField("사용할 비밀번호", text: $password)
                            .keyboardType(.numberPad)
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(10.0)
                            .textContentType(.password)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(overlayColorPassword, lineWidth: 0.75))
                    }
                }
                Button(action: {isSecured.toggle()}, label: {Image(systemName: self.isSecured ? "eye.slash" : "eye")
                        .accentColor(.gray)
                })
            }

            
            HStack{
                Button("취소", action: { isShowingSheet.toggle()})
                Spacer()
                
                
                Button{
                    //submit necessary fields
                    //if userName is empty
                    if userName.isEmpty && password.isEmpty{
                        overlayColorUser = Color.red
                        overlayColorPassword = Color.red
                    }
                    if !userName.isEmpty && password.isEmpty{
                        overlayColorUser = Color.clear
                        overlayColorPassword = Color.red
                    }
                    if userName.isEmpty && !password.isEmpty{
                        overlayColorUser = Color.red
                        overlayColorPassword = Color.clear
                    }
                    
                    //submit the userName && password thru api.
                    if !userName.isEmpty && !password.isEmpty{
                        overlayColorUser = Color.clear
                        overlayColorPassword = Color.clear
                        
                        
                        
                        
                        
                        isShowingSheet.toggle()
                        
                    }
                    
                }label: {
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
        .padding(.vertical, 20)
        .padding()
    }
}
