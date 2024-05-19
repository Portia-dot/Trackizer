//
//  ContentView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-15.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingMain = false
    @State private var path = NavigationPath()
    var body: some View {
        NavigationStack(path: $path){
            VStack {
                if isShowingMain{
                    //Login For Logged in users
                    
                    MainTabView()
                }else{
                    OpenScreen(
                        onRegister: {path.append("register")},
                        onLoginOne: { path.append("loginone") }
                    )
                        .transition(.slide)
                        .preferredColorScheme(.dark)
                        .toolbar(.hidden)
                }
            }
            //IOS 16+
            .navigationDestination(for: String.self) { identifier in
                switch identifier {
                case "main":
                    MainTabView()
                case "loginone":
                    AuthView(mode: .login)
                case "register":
                    RegisterOneView() 
                default:
                    Text("Unknown View")
                
                }
            }
        }
    }
    private func navigate(to destination: String){
        path.append(destination)
    }
}

#Preview {
    ContentView()
}
