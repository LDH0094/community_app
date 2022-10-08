//
//  ProfileView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/8/22.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            headerView
            HStack{
                Image(systemName: "bell")
                Image(systemName: "bell")
            }
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
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
}
