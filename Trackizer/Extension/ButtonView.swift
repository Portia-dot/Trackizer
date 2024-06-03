//
//  ButtonView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-28.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var viewModel : AuthViewModel
    @State private var navigateToOpenView = false
    var body: some View {
        VStack{
            Button("Log Out"){
                viewModel.logout()
                self.navigateToOpenView = true
            }
            .navigationDestination(isPresented: $navigateToOpenView, destination: {
                OpenScreen()
            })
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            .padding(.top, 20)
        }
        .padding()
    }
}

#Preview {
    ButtonView()
        .environmentObject(AuthViewModel())
}
