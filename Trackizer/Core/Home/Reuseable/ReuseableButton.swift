//
//  ReuseableButton.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct ReuseableButton: View {
    var text: String
    var action: () -> Void
    var colors: Color
    
    var body: some View {
        Button(action: action){
            Text(text)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(colors)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: colors.opacity(0.5), radius: 10, x: 0, y: 10)
                .padding(.horizontal)
        }
        
    }
}

#Preview {
    ReuseableButton(text: "Get Started", action: {
        print("Button Tapped")
    }, colors: .gray)
    .padding()
}
