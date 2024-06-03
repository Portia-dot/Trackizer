//
//  Buttons.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-06-02.
//

import SwiftUI

struct Buttons: View {
    var text: String
    var action: (() -> Void)?
    var colors: Color
    @GestureState private var isPressed = false
    
    var body: some View {
        Button {
            action?()
        } label: {
            Text(text)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(colors)
                .cornerRadius(25)
                .shadow(color: colors.opacity(0.8), radius: 10, x: 0, y: 10)
                .padding(.horizontal)
                .scaleEffect(isPressed ? 0.96 : 1)
        }
        .gesture(
            LongPressGesture(minimumDuration: 0.01)
                .updating($isPressed) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
            
        )
        
        
    }
}

#Preview {
    Buttons(text: "Get Started", colors: .pink)
        .preferredColorScheme(.dark)
}
