//
//  ProgressViewDemo.swift
//  Universal_community
//
//  Created by 이덕현 on 10/23/22.
//

import SwiftUI

struct ProgressViewDemo: View {
    var body: some View {
        HStack{
            Spacer()
            ProgressView()
                .onAppear{
                    print("spinner am I?")
                }
            Spacer()
        }
    }
    
    struct ProgressViewDemo_Previews: PreviewProvider {
        static var previews: some View {
            ProgressViewDemo()
        }
    }
}
