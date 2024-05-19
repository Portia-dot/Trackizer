//
//  BillsListView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct BillsListView: View {
    var body: some View {
        VStack(spacing: 20){
            BillItemView(leadingView: ItemDateView(dueDate: Date()), title: "Spotify", price: "$5.99")
            BillItemView(leadingView: ItemDateView(dueDate: Date()), title: "Youtube Premium", price: "$18.99")
            BillItemView(leadingView: ItemDateView(dueDate: Date()), title: "Microsoft OneDrive", price: "$29.99")
        }
        .padding()
    }
}

#Preview {
    BillsListView()
        .preferredColorScheme(.dark)
}
