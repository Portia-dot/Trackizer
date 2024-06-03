//
//  SettingViews.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-24.
//

import SwiftUI

struct SettingViews: View {
    @EnvironmentObject var authViewModel: AuthViewModel

    var body: some View {
        NavigationStack{
            ScrollView{
                ProfileSection()
                GeneralSection()
                Subsciptions()
                Appearance()
                ButtonView()
                    .environmentObject(authViewModel)
                    
            }
            .navigationTitle("Settings")
            .font(.title3)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SettingViews()
        .environmentObject(AuthViewModel())
        .preferredColorScheme(.dark)
}

struct ProfileSection: View {
    var body: some View{
        VStack(spacing: 10){
            Image(systemName: "person")
                .resizable()
                .clipShape(Circle())
                .frame(width: 120, height: 120)
            
            Text("John Doe")
                .font(.title2)
                .fontWeight(.bold)
            
            Text("j.doe@gmail.com")
                .foregroundStyle(.gray)
            Button {
                
            } label: {
                Text("Edit Profile")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Capsule())
                
            }

                
        }
        .padding()
    }
}

struct GeneralSection: View {
    @State private var selectedSecurityType = "Face ID"
    let security = ["Face ID", "Finger ID", "None"]
    @State private var iCloudSync = false
    var body: some View {
        VStack (alignment: .leading){
            SectionHeaderView(title: "General")
            VStack{
                NavigationStack {
                        HStack{
                            Image(systemName: "faceid")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.horizontal, 10)
                            
                            Picker("Security", selection: $selectedSecurityType) {
                                ForEach(security, id: \.self) {
                                    Text($0)
                                }
                                .padding(.vertical, 5)
                            }
                            .pickerStyle(.navigationLink)
                            Divider()
                        }
                        HStack{
                            SettingSection(iconName: "icloud", title: "iCloud Sync")
                            Toggle("", isOn: $iCloudSync)
                                .labelsHidden()
                        }
                }
                .foregroundStyle(.white)
                .padding()
                
            }
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
        }
        .padding()
    }
}


struct Subsciptions: View {
    @State private var sortingType = "Date"
    @State private var summaryType = "Average"
    @State private var currencyType = "USD"
    let sorting = ["Date", "Price", "Newest", "Oldest"]
    let summary = ["Average", "Total"]
    let currency = ["USD", "CAD", "EUR"]
    var body: some View {
        VStack (alignment: .leading){
            SectionHeaderView(title: "My Subscriptions")
            VStack{
                NavigationStack {
                    HStack{
                        Image(systemName: "arrow.up.and.down.text.horizontal")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        
                        Picker("Sorting", selection: $sortingType) {
                            ForEach(sorting, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        
                    }
                    .foregroundStyle(.white)
                }
                //Summary View
                NavigationStack {
                        HStack{
                            Image(systemName: "chart.pie")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .padding(.horizontal, 10)
                            
                            Picker("Summary", selection: $summaryType) {
                                ForEach(summary, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.navigationLink)
                            
                        }
                        .padding(.vertical, 10)
                        .foregroundStyle(.white)

                    }
                // Currency
                NavigationStack {
                    HStack{
                        Image(systemName: "coloncurrencysign.arrow.circlepath")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        
                        Picker("Currency", selection: $currencyType) {
                            ForEach(currency, id: \.self) {
                                Text($0)
                            }
                            .padding(.vertical, 5)
                        }
                        .pickerStyle(.navigationLink)
                        
                    }
                        .foregroundStyle(.white)
                    }

                
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
        }
       .padding()
    }
}

struct Appearance: View {
    @State private var appearance = "Dark"
    @State private var appIcon = "Classic"
    
    let theme = ["Dark", "Light"]
    let appIcons = ["Classic", "Vintage", "New"]
    
    var body: some View {
        VStack (alignment: .leading){
            SectionHeaderView(title: "Appearance")
            VStack{
                NavigationStack {
                    HStack{
                        Image(systemName: "note")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        
                        Picker("App Icon", selection: $appIcon) {
                            ForEach(appIcons, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        
                    }
                    .foregroundStyle(.white)
                }
                //Summary View
                NavigationStack {
                    HStack{
                        Image(systemName: "light.max")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .padding(.horizontal, 10)
                        
                        Picker("Theme", selection: $appearance) {
                            ForEach(theme, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(.navigationLink)
                        
                    }
                    .padding(.vertical, 10)
                    .foregroundStyle(.white)
                    
                }

                
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
        }
       .padding()
    }
}

