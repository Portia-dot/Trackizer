//
//  ReuseableWithLogoView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct ReuseableWithLogoView: View {
    
    var text: String
    var action: () -> Void
    var colors: Color
    var textColor: Color
    var imageName: String
    
    var body: some View {
        Button(action: action){
            HStack{
                Spacer()
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundStyle(textColor)
                Spacer()
                Text(text)
                    .fontWeight(.bold)
                    .foregroundStyle(textColor)
                Spacer()
            }
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
    ReuseableWithLogoView(text: "Sign In With Apple", action: {
        print("Apple Sign In")
    }, colors: .white, textColor: .black, imageName: "apple.logo")
    .preferredColorScheme(.dark)
}
