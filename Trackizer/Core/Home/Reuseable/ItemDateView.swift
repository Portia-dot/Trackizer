//
//  ItemDateView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct ItemDateView: View {
    var dueDate: Date
    var body: some View {
        VStack{
            Text(monthString(from: dueDate))
                .font(.headline)
                .bold()
            Text(dayString(from: dueDate))
                .font(.headline)
                .bold()
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(hex: "353542"))
//                .fill(.ultraThinMaterial)
        }
    }
    private func dateString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        return formatter.string(from: date)
        
    }
    private func monthString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM"
        return formatter.string(from: date)
    }
    
    private func dayString(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d"
        return formatter.string(from: date)
    }
}
#Preview {
    ItemDateView(dueDate: Date())
        .preferredColorScheme(.dark)
}
