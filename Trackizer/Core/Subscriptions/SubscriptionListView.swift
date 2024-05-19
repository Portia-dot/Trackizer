//
//  SubscriptionListView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct SubscriptionListView: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                ItemView(logo: Image("YT Premium Lgoo"), title: "Youtube Premium", price: "$9.99")
                ItemView(logo: Image("Spotify Logo"), title: "Spotify Premium", price: "$29.99")
                ItemView(logo: Image("Netflix Logo"), title: "Netflix", price: "$9.99")
                ItemView(logo: Image("OneDrive Logo"), title: "One Drive", price: "$19.99")
                ItemView(logo: Image("HBO GO Logo"), title: "HBO ", price: "$90.99")
            }
            .padding()

        }
    }
}

#Preview {
    SubscriptionListView()
        .preferredColorScheme(.dark)
}
