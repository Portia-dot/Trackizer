//
//  BudgetView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-16.
//

import SwiftUI

struct BudgetView: View {
    var spentPercentage = 0.75
    var body: some View {
        ZStack{
            Image("Ellipse1")
                .resizable()
                .scaledToFit()
                .frame(width: 400, height: 500)
            Image("Ellipse2")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .offset(y: -20)
            CircleBackground()
            VStack(spacing: 20){
                Image("logo")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 120, height: 120)
                Text("$1,235")
                    .font(.system(size: 40))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                Text("This Month bills")
                    .font(.system(size: 16))
                    .foregroundStyle(.gray)
                Button {
                    print("Month Budget")
                } label: {
                    Text("See your budget")
                        .fontWeight(.medium)
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color(hex: "1C1C23").opacity(0.8))
                        .clipShape(Capsule())
                        .overlay{
                            Capsule()
                                .stroke(Color.gray, lineWidth: 1)
                        }
                        .shadow(color: .gray, radius: 3)
                    
                }

            }
        }.preferredColorScheme(.dark)
    }
}

#Preview {
    BudgetView()
}


struct CircleBackground: View {
    var spentPercentage = 0.90
    @State private var animatedPercentage: CGFloat = 0
    var body: some View{
        ZStack{
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.gray.opacity(0.2), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(135))
                .frame(width: 350, height: 350)
            
            Circle()
                .trim(from: 0, to: animatedPercentage)
                .stroke(gradient(for: spentPercentage ), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(135))
                .frame(width: 350, height: 350)
            
        }
        .onAppear{
            withAnimation(.easeOut(duration: 2)){
                animatedPercentage = CGFloat(spentPercentage * 0.75)
            }
        
        }
    }
    
    func gradient(for percentage: Double) -> AngularGradient {
        AngularGradient (
            gradient: Gradient(colors: [Color.green, Color.red]),
            center: .center,
            startAngle: .degrees(0),
            endAngle: .degrees(360 * percentage)
        )
    }
}
