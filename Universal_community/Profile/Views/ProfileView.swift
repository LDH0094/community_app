//
//  ProfileView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/8/22.
//

import SwiftUI
import KakaoSDKUser

struct ProfileView: View {
    @ObservedObject var userViewModel = UserInfoViewModel()
    @State private var selectedFilter: UserFilterViewModel = .myPosts
    @Namespace var animation
    
    
    
    
    var body: some View {
        Group{
            if (userViewModel.hasLoggedIn){
                VStack(alignment: .leading){
                    userWidget
                    profileFilterBar
                    
                    postView
                    
                    Spacer()
                }
            }
            if (!userViewModel.hasLoggedIn){
                LoginView()
            }
        }
        
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

extension ProfileView {
    
    var actionButtons: some View {
        VStack{
            Button{
                    userViewModel.logOut()
            } label: {
                Image(systemName: "square.and.pencil")
            }
            Button("check memID"){
                var id = UserDefaults.standard.integer(forKey: "memberId")
                print("my Id is: \(id)")
            }
        }
    }
    
    var userWidget: some View {
        VStack(alignment: .leading, spacing: 8){
            HStack(alignment: .center){
                Text(userViewModel.user.nickname)
                    .font(.title2).bold()
                    .textCase(.uppercase)
                Text(userViewModel.user.authId)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
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

