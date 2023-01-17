//
//  MatchView.swift
//  LoveMatch
//
//  Created by youlserf on 16/01/23.
//

import SwiftUI

struct MatchView: View {
    var loveMatch:LoveMatch
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName:    Int(loveMatch.percentage) ?? 0 > 50 ? "hand.thumbsup" : "hand.thumbsdown")
                    .foregroundColor(.blue)
                Spacer()
                Text("\(loveMatch.percentage)% match.")
                Spacer()
            }
            Text("\(loveMatch.fname) and \(loveMatch.sname) have a \(loveMatch.percentage)% match. \(loveMatch.result)")
                .font(.system(size: 12, weight: .light, design: .serif))
                .padding()
        }
    }
}


