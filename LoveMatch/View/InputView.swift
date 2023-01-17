//
//  InputView.swift
//  LoveMatch
//
//  Created by youlserf on 16/01/23.
//

import SwiftUI

struct InputView: View {
    var placeHolder: String
    @Binding var name: String
    
    var body: some View {
        TextField(placeHolder, text: $name)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 2)
            )
    }
}


