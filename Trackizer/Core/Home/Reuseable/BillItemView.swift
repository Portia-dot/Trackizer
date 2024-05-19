//
//  BillItemView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct BillItemView <LeadingView: View> : View {
    let leadingView: LeadingView
    var title: String
    var price: String
    var color: Color = Color.black
    
    var body: some View {
        HStack{
            leadingView
                Text(title)
                    .font(.title3)
                    .bold()
            Spacer()
                Text(price)
                    .font(.title3)
                    .bold()
            }
        .padding(10)
//        .padding(.horizontal)
        .background{
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
            
        }
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(hex: "353542"))
        }
//        .padding()
    }
}

#Preview {
    BillItemView( leadingView: ItemDateView(dueDate: Date()),
                  title: "Subscription Renewal",
                  price: "$19.99")
    .preferredColorScheme(.dark)
}
