//
//  OpenScreen.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct OpenScreen: View {
    @EnvironmentObject var navigationManager: NavigationManager
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
                
                ReuseableButton(text: "Get Started", destination: AnyView(AuthView(mode: .register)), colors: .pink)
                ReuseableButton(text: "I have an account", destination: AnyView(AuthView(mode: .login)), colors: .gray)
            }
            .padding()
//            Spacer()
        }
    }
}

struct OpenScreen_Previews: PreviewProvider {
    static var previews: some View {
        OpenScreen(
//            onRegister: { print("Register tapped") },
//            onLoginOne: { print("Login tapped") }
        )
        .preferredColorScheme(.dark)
    }
}
