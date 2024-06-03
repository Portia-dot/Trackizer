//
//  SettingSection.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-27.
//

import SwiftUI

struct SettingSection: View {
    var iconName: String
    var title: String
    var body: some View {
        HStack{
            Image(systemName: iconName)
                .resizable()
                .frame(width: 20, height: 20)
                .padding(.horizontal, 10)
            Text(title)
                .bold()
            Spacer()
        }
    }
}

#Preview {
    SettingSection(iconName: "faceid", title: "Security")
}
