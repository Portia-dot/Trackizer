//
//  HomeView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-15.
//

import SwiftUI

struct HomeView: View {
    @State private var showSetting = false
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack{
                    BudgetView()
                    HStack{
                        SubRankingView(title: "Active Subs", count: 12, fillColor: Color.pink)
                        SubRankingView(title: "Highest Subs", count: 19.99, fillColor: Color.purple)
                        SubRankingView(title: "Lowest Subs", count: 5.99, fillColor: Color.green)
                    }
                    Spacer()
                    SelectorView()
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                            NavigationLink(destination: SettingViews()) {
                                Image(systemName: "gear")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                                    .foregroundStyle(.gray)
                                    .padding()
                            }
                    }
                }

            }
            
            
        }
        
        
    }
        
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
