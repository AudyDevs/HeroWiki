//
//  SuperHeroItem.swift
//  HeroWiki
//
//  Created by AudyDev on 31/10/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct SuperHeroItem: View {
    let superhero: SuperHero
    
    var body: some View {
        ZStack{
            WebImage(url: URL(string: superhero.image.url))
                        .resizable()
                        .indicator(.activity)
                        .scaledToFill()
                        .frame(height: 200)
            VStack{
                Spacer()
                Text(superhero.name)
                    .font(.custom("KomikaAXIS", size: 24))
                    .bold()
                    .foregroundColor(.white)
                    .padding(.bottom, 6)
                    .frame(maxWidth: .infinity)
                    .background(.black.opacity(0.65))
            }
        }.frame(height: 200)
            .cornerRadius(24)
    }
}
