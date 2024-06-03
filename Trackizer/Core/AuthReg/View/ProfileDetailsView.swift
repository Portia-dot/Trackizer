//
//  ProfileDetailsView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-23.
//

import SwiftUI

struct ProfileDetailsView: View {
    @StateObject private var viewModel = ProfileDetailsViewModel()
    @EnvironmentObject var navigationManager: NavigationManager
    @State private var navigateToMain = false

    @State private var fullName = ""
    @State private var age = ""
    @State private var country = ""
    @State private var bank = ""
    @State private var username = ""
    var body: some View {
        VStack{
            VStack(spacing: 30){
                ProfileImageSelector(imageSelected: $viewModel.profileImage)
                    .padding(.bottom, 20)
                CustomTextFieldView(placeholder: "Full Name", text: $viewModel.fullName)
                CustomTextFieldView(placeholder: "Username", text: $viewModel.username)
                CustomTextFieldView(placeholder: "Country", text: $viewModel.country)
                CustomTextFieldView(placeholder: "Age", text: $viewModel.age)
                CustomTextFieldView(placeholder: "Bank", text: $viewModel.bank)
                
                Buttons(text: "Save Details", action: {
                    viewModel.saveProfileDetails() { success in
                        if success{
                            self.navigateToMain = true
                        }else{
                           print("Debug: Error Saving Profile Details")
                        }
                    }
                }, colors: .gray)
                .navigationDestination(isPresented: $navigateToMain) {
                    MainTabView()
                }
            }
            .padding(.top, 30)
            Spacer()
        }.background{
            ZStack{
                Image("Frame 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
        }
    }
}



#Preview {
    ProfileDetailsView()
        .preferredColorScheme(.dark)
}
