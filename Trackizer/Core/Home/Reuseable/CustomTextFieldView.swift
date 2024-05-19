//
//  CustomTextFieldView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-18.
//

import SwiftUI

struct CustomTextFieldView: View {
   var placeholder: String
    @Binding var text: String
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .background(Color.white.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .foregroundStyle(.white)
            .padding(.horizontal, 10)
            
    }
}

