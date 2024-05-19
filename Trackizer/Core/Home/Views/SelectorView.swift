//
//  SelectorView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-16.
//

import SwiftUI

struct SelectorView: View {    
    @State private var activeBar : Tab = .subscriptions
    
    var body: some View {
       
        VStack(spacing: 5) {
            SelectorControlView(activeBar: $activeBar,  tabs: Tab.allCases, activeTint: .white, inActiveTint: .gray.opacity(0.5)) { size in
                RoundedRectangle(cornerRadius: 30)
                    .fill(Color(hex: "353542"))
                    .frame(height: 50)
                    .padding(.horizontal)
                    .frame(maxHeight: .infinity, alignment: .center)
                    
            }
            .background{
                RoundedRectangle(cornerRadius: 30)
                    .fill(.black)
                    .frame(maxWidth: .infinity)
                    .ignoresSafeArea()
                    .overlay{
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.white, lineWidth: 2)
                    }
            }
            .padding(.horizontal, 15)
            if activeBar == .subscriptions{
                SubscriptionListView()
            }else if activeBar == .bills {
                BillsListView()
            }
            Spacer(minLength: 0)
        }
        .padding(.vertical, 15)
//        .frame(height: 80)
        .animation(.snappy, value: 0)
        
    }
}

enum Tab: String, CaseIterable {
    case subscriptions = "Your Subscriptions"
    case bills = "Bills"
}


#Preview {
    SelectorView()
}
