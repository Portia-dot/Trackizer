//
//  OpenScreen.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct OpenScreen: View {
    var onRegister: () -> Void
    var onLoginOne: () -> Void
    var body: some View {
        VStack{
            ZStack{
                Image("Frame 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.top, 50)
                    Spacer()
                }
                
            }
            .frame(height: UIScreen.main.bounds.height / 2)
            
            VStack(spacing: 20){
                
                Text("is simply dummy text of the printing and typesetting industry.")
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                ReuseableButton(text: "Get Started", action: {
                    onRegister()
                }, colors: .pink)
                ReuseableButton(text: "I have an account", action: {
                    onLoginOne()
                }, colors: .gray)
            }
            .padding()
//            Spacer()
        }
    }
}

struct OpenScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpenScreen(
            onRegister: { print("Register tapped") },
            onLoginOne: { print("Login tapped") }
        )
        .preferredColorScheme(.dark)
    }
}
