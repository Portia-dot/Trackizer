//
//  AuthView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-18.
//

import SwiftUI

struct AuthView: View {
//    var navigation: (String) -> Void
    @EnvironmentObject var navigationManager: NavigationManager
    @EnvironmentObject var authViewModel : AuthViewModel
    @State private var isLoading = false
    @State private var shouldNavigate = false
    @State private var navigateToProfileDetails = false
    @State private var navigationToMain = false
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
                    Buttons(text: "Get Started, its free", action: {
                        register()
                    }, colors: .pink)
                    .padding(.top)
                    .navigationDestination(isPresented: $navigateToProfileDetails) {
                        ProfileDetailsView()
                    }
                    Spacer()
                    Spacer()
                    
                    Text("Do you have an account already?")
                    ReuseableButton(text: "Sign In", destination: AnyView(AuthView(mode: .login)), colors: .gray)
                    Spacer()
                } else {
                    Buttons(text: "Sign In", action: {
                        authViewModel.login(withEmail: email, password: password)
                    }, colors: .pink)
                    .navigationDestination(isPresented: $authViewModel.didAuthenticateUser){
                        MainTabView()
                    }
                    
                    Spacer()
                    Spacer()
                    
                    Text("If you dont have an account yet ?")
                    ReuseableButton(text: "Sign Up", destination: AnyView(AuthView(mode: .register)), colors: .gray)
                }
                Spacer()
            }

            
        }
    }
    func register(){
        isLoading = true
        authViewModel.registerUser(withEmail: email, password: password) {success in
            isLoading = false
            if success {
                self.navigateToProfileDetails = true
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
    AuthView( mode: .login)
        .preferredColorScheme(.dark)
}
