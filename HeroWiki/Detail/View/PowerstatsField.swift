//
//  PowerstatsField.swift
//  HeroWiki
//
//  Created by AudyDev on 2/11/24.
//

import SwiftUI

struct PowerstatsField: View {
    let title: String
    let value: String
    let color: Color
    
    @State private var animatedValue: Double = 0
    
    var body: some View {
        HStack{
            Text(title)
                .frame(width: 85, alignment: .trailing)
                .font(.custom("KomikaAxis", size: 12))
                .bold()
                .foregroundColor(.textTitleApp)
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: CGFloat(animatedValue), height: 20)
                    .foregroundColor(color)
                    .animation(.easeInOut(duration: 1.0), value: animatedValue)
                Rectangle()
                    .frame(width: 125, height: 20)
                    .foregroundColor(.black.opacity(0))
                .border(.textTitleApp, width: 3)
            }.onChange(of: value){
                withAnimation {
                    animatedValue = (Double(value) ?? 0) * 1.25
                }
            }
            Text(value)
                .frame(width: 25)
                .font(.custom("KomikaAxis", size: 13))
                .bold()
                .foregroundColor(.textTitleApp)
        }
    }
}

#Preview {
    PowerstatsField(title: "Fuerza", value: "80", color: .blue)
}
