//
//  ProfileView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/8/22.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: UserFilterViewModel = .myPosts
    @Namespace var animation
    @State var user: User
    @State var isLoggedIn: Bool = false
    
    var body: some View {
        VStack(alignment: .leading){
            userInfo
            profileFilterBar
            
            postView
            
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(googleId: "132", nickname: "deok#0001"))
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading){
            Color(.systemBlue)
                .ignoresSafeArea()
            
            VStack {
                Button{
                    
                } label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(.white)
                        .offset(x: 16, y: 12)
                }
                
                Circle()
                    .frame(width: 72, height: 72)
                .offset(x: 16 , y: 24)
            }
        }
        .frame(height: 96)
    }
    
    var actionButtons: some View {
        HStack{
            Spacer()
            Group{
                if isLoggedIn{
                    Button{
                    } label: {
                        Text("프로필 수정")
                            .font(.subheadline).bold()
                            .foregroundColor(.black)
                            .frame(width: 120, height: 32)
                            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                    }
                } else {
                    LoginView()
                }
                
            }
        }
        .padding(.trailing)
    }
    
    var userInfo: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack(alignment: .center){
                Text(user.nickname)
                    .font(.title2).bold()
                    .textCase(.uppercase)
                Text("#2785")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                actionButtons
            }
            Text("My description goes heresdsdsdsd")
                .font(.subheadline)
                .padding(.vertical)
            
            //Followers ; Following ; Posts goes here
            HStack(spacing: 24){
                HStack(spacing: 4){
                Text("20K")
                    .font(.subheadline)
                    .bold()
                Text("Following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
                HStack(spacing: 4){
                    Text("6.9M")
                        .font(.subheadline)
                        .bold()
                    Text("Followers")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
            }
            .padding(.vertical)
        }
        .padding(.horizontal)
    }
    
    var profileFilterBar: some View {
        HStack{
            ForEach(UserFilterViewModel.allCases, id: \.rawValue) { item in
                VStack{
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold :
                                .regular)
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    
                    if (selectedFilter == item){
                        Capsule()
                            .foregroundColor(.blue)
                            .frame(height: 3)
                    } else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 3)
                    }
                }
                .onTapGesture {
                    withAnimation(.easeOut){
                        self.selectedFilter = item
                    }
                }
            }
        }
        .overlay(Divider().offset(x:0, y:16))
    }
    
    var postView: some View {
        ScrollView{
            LazyVStack{
                ForEach(0...9, id: \.self){_ in
                    PostRowView(post: Post(id: 12, title: "hi", content: "demo placeholder http 1234 demo placeholder http 1234 demo", writer: "deok#0001", likeCount: 10, commentCount: 15, date: "sdad-asdasd-120", liked: true))
                    }
                }
            }
        }
    }

