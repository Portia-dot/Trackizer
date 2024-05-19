//
//  PasswordStrenghtView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-18.
//

import SwiftUI

struct PasswordStrengthView: View {
    var strength : Double
    var body: some View{
        GeometryReader{ geometry in
            ZStack{
                RoundedRectangle(cornerRadius: 5)
                    .fill(.ultraThinMaterial)
                    .frame(height: 5)
                
                RoundedRectangle(cornerRadius: 5)
                    .fill(strengthColor(strength: strength))
                    .frame(width: geometry.size.width * CGFloat(strength), height: 5)
                    .animation(.snappy, value: strength)
            }
            Text("Use 8 or more characters with a mix of letters, numbers & sysmbols")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding()
//          .padding()
        }
        .padding()
        
    }
    
    private func strengthColor(strength: Double) -> Color{
        switch strength {
        case 0.0..<0.33: return .red
        case 0.33..<0.66: return .yellow
        case 0.66..<1.0: return .green
        default: return .green
        }
    }
}
