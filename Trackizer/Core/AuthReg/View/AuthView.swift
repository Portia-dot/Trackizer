//
//  AuthView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-18.
//

import SwiftUI

struct AuthView: View {
//    var navigation: (String) -> Void
    enum AuthMode {
        case login
        case register
    }
    var mode: AuthMode
    @State private var email = ""
    @State private var password = ""
    @State private var passwordStrength = 0.0
    @State private var rememberMe = false
    
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
                        .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                        .padding(.top, 50)
                    Spacer()
                }
                
            }
            .frame(height: UIScreen.main.bounds.height / 3)
                        Spacer()
            VStack(spacing: 20){
                CustomTextFieldView(placeholder: "Email Address", text: $email)
                if mode == .register{
                    VStack{
                        CustomTextFieldView(placeholder: "Password", text: $password)
                            .onChange(of: password) {oldValue, newValue in
                                passwordStrength = calculatePasswordStrength(password: newValue)
                            }
                        PasswordStrengthView(strength: passwordStrength)
                    }
                }else{
                    VStack{
                        CustomTextFieldView(placeholder: "Password", text: $password)
                        Toggle("Remember me", isOn: $rememberMe)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                if mode == .register{
                    ReuseableButton(text: "Get Started, its free!", action: {
                        print("Register")
                    }, colors: .pink)
                    
                    Spacer()
                    Spacer()
                    
                    Text("Do you have an account already?")
                    ReuseableButton(text: "Sign In", action: {
                        print("Sign In")
                    }, colors: .gray)
                    Spacer()
                } else {
                    ReuseableButton(text: "Sign In", action: {
                        print("Sign In")
                    }, colors: .pink)
                    
                    Spacer()
                    Spacer()
                    
                    Text("If you dont have an account yet ?")
                    ReuseableButton(text: "Sign In", action: {
                        print("Sign UP")
                    }, colors: .gray)
                }
                Spacer()
            }

            
        }
    }
}
private func calculatePasswordStrength(password: String) -> Double{
    switch password.count {
    case 0..<6: return 0.0
    case 6..<8: return 0.3
    case 8..<10: return 0.6
    default: return 1.0
    }
}

#Preview {
    AuthView( mode: .register)
        .preferredColorScheme(.dark)
}
