//
//  SubsciptionItemView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct ItemView: View {
    var logo: Image
    var title: String
    var price: String
    var color: Color = Color.black
    var body: some View {
        HStack{
            logo
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                Text(title)
                    .font(.title3)
                    .bold()
            Spacer()
                Text(price)
                    .font(.title3)
                    .bold()
            }
        .padding(15)
        .padding(.horizontal)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(hex: "353542"))
        }
    }
}

#Preview {
    ItemView(logo: Image("Netflix Logo"), title: "Netflix", price: "$12.99")
        .preferredColorScheme(.dark)
}
