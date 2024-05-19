//
//  SubRankingView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-16.
//

import SwiftUI

struct SubRankingView<Value: CustomStringConvertible> : View {
    var title: String
    var count: Value
    var fillColor: Color
    var body: some View {
            VStack{
                Text(title)
                    .font(.system(size: 15))
                    .foregroundStyle(.gray)
                    .fontWeight(.medium)
                Text("\(count)")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12))
            .background(Color.black.opacity(0.5))
            .cornerRadius(15)
            .shadow(color: .gray.opacity(0.5), radius: 2, x:1, y: 1)
            .overlay{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 1)
            }
            .overlay(
                Rectangle()
                    .fill(fillColor)
                    .frame(width: 60, height:2)
                    .offset(y: -(8 + 20 ))
            )
    }
}

#Preview {
    SubRankingView(title: "Active Sub", count: 12, fillColor: Color.pink)
        .preferredColorScheme(.dark)
}
