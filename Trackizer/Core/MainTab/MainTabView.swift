//
//  MainTabView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-15.
//

import SwiftUI

struct MainTabView: View {
    init () {
        UITabBar.appearance().isHidden = true
    }
    @State private var selectedIndex: Int = 0
    var body: some View {
        TabView(selection: $selectedIndex){
            HomeView()
                .tag(0)
            //Spending
            SpendingBudgeting()
                .tag(1)
            // Calender
            Calendar()
                .tag(2)
            //Credit Card
            CreditCard()
                .tag(3)
        }
        .preferredColorScheme(.dark)
        .ignoresSafeArea()
        CustomTabBar(selectedIndex: $selectedIndex)
    }
}

#Preview {
    MainTabView()
}
