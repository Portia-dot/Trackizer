//
//  ReuseableButton.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct ReuseableButton: View {
    var text: String
    var destination: AnyView
    var colors: Color
    @GestureState private var isPressed = false
    
    var body: some View {
        NavigationLink(destination: destination){
            Text(text)
                .fontWeight(.bold)
                .foregroundStyle(.white)
                .padding()
                .frame(maxWidth: .infinity)
                .background(colors)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .shadow(color: colors.opacity(0.5), radius: 10, x: 0, y: 10)
                .padding(.horizontal)
                .scaleEffect(isPressed ? 0.96 : 1)
        }
        .gesture(
            LongPressGesture(minimumDuration: 0.01)
                .updating($isPressed) { currentState, gestureState, transaction in
                    gestureState = currentState
                }
        )
        .animation(.easeOut, value: isPressed)
        
    }
}

#Preview {
    ReuseableButton(text: "Get Started", destination: AnyView(OpenScreen()), colors: .gray)
        .padding()
}

