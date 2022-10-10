//
//  TextArea.swift
//  Universal_community
//
//  Created by 이덕현 on 10/10/22.
//

import SwiftUI

struct TextArea: View {
    @Binding var text: String
    let placeHolder: String
    
    init(text: Binding<String>, _ placeHolder: String) {
        self._text = text
        self.placeHolder = placeHolder
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .topLeading){
            
            if text.isEmpty{
                Text(placeHolder)
                    .foregroundColor(Color(.placeholderText))
                    .padding(.vertical, 12)
                    .padding(.horizontal, 8)
                
            }else{
                TextEditor(text: $text)
                    .padding(4)
            }

        }
        .font(.body)
    }
}

