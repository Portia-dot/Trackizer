//
//  RegisterOneView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct RegisterOneView: View {
    @State private var path = NavigationPath()
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
            .frame(height: UIScreen.main.bounds.height / 2.5)
            
            VStack(spacing: 20){
                ReuseableWithLogoView(text: "Sign Up With Apple", action: {
                    path.append("empty")
                }, colors: .blue, textColor: .white, imageName: "apple.logo")
                
                ReuseableWithLogoView(text: "Sign Up With Google", action: {
                    path.append("empty")
                }, colors: .green, textColor: .black, imageName: "g.circle")
                ReuseableWithLogoView(text: "Sign Up With Apple", action: {
                    path.append("empty")
                }, colors: .gray, textColor: .white, imageName: "f.square")
            }
            .padding()
            Spacer()
            Text("Or")
                .bold()
            Spacer()
            
            ReuseableButton(text: "Sign up with Email", action: {
                path.append("registerEmail")
            }, colors: .orange)
            .padding()
            Spacer()
            Text("By registering, you agree to our Terms of Use.")
                .multilineTextAlignment(.leading)
                .padding()
                .padding(.vertical,6)
                .font(.caption)
        
        }
        .navigationDestination(for: String.self) { identifier in
            switch identifier {
            case "registerEmail":
                AuthView(mode: .register)
            case "empty":
                EmptyView()
            default:
                Text("Unknown destination")
            }
        }
    }
}

#Preview {
    RegisterOneView()
        .preferredColorScheme(.dark)
}
