//
//  PostItemView.swift
//  Universal_community
//
//  Created by 이덕현 on 10/23/22.
//

import SwiftUI

struct PostItemView: View {
    var id: Int
    var body: some View {
        Text("id of the following \(id)")
    }
}

struct PostItemView_Previews: PreviewProvider {
    static var previews: some View {
        PostItemView(id: 20)
    }
}
