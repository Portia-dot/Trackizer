//
//  SelectorControlView.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-17.
//

import SwiftUI

struct SelectorControlView <Indicator: View> : View {
    @Binding var activeBar: Tab
    var tabs: [Tab]
    var font: Font = .title3
    var height: CGFloat = 70
    var activeTint: Color
    var inActiveTint: Color
    @ViewBuilder var indicatorView: (CGSize) -> Indicator
    @State private var minX: CGFloat = .zero
    @State private var excessTabWidth: CGFloat = .zero
    
    var body: some View {
        GeometryReader{
            let size = $0.size
            let containerWidthSizeForEachBar = size.width / CGFloat(tabs.count)
            
            HStack(spacing:0){
                ForEach(tabs, id: \.rawValue){ tab in
                    Group{
                        Text(tab.rawValue)
                            .bold()
                            .foregroundStyle(.white)
                            .font(.footnote)
                    }
                    .font(font)
                    .foregroundStyle(activeBar == tab ? activeTint : inActiveTint)
                    .animation(.snappy, value: activeBar)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .contentShape(.rect)
                    .onTapGesture {
                        
                        if let index = tabs.firstIndex(of: tab), let activeIndex = tabs.firstIndex(of: activeBar){
                            activeBar = tab
                            
                            withAnimation(.snappy(duration: 0.25, extraBounce: 0), completionCriteria: .logicallyComplete) {
                                excessTabWidth = containerWidthSizeForEachBar * CGFloat(index - activeIndex)
                            } completion: {
                                withAnimation(.snappy( duration: 0.25, extraBounce: 0)) {
                                    minX = containerWidthSizeForEachBar * CGFloat(index)
                                    excessTabWidth = 0
                                }
                            }
                        }
                        
                        
                    }
                    .background(alignment: .leading){
                        if tabs.first == tab {
                            GeometryReader{
                                let size  = $0.size
                                indicatorView(size)
                                    .frame(width: size.width + (excessTabWidth < 0 ? -excessTabWidth: excessTabWidth), height: size.height)
                                    .frame(width: size.width, alignment: excessTabWidth < 0 ? .trailing : .leading)
                                    .offset(x: minX)
                            }
                        }
                    }
                }
            }
        }
        .frame(height: height)
    }
}

#Preview {
    SelectorView()
    //        .preferredColorScheme(.dark)
}
