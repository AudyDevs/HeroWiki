//
//  ItemFrameDetail.swift
//  HeroWiki
//
//  Created by AudyDev on 2/11/24.
//

import SwiftUI

struct ItemFrameDetail: View {
    let title: String
    let description: String
    var body: some View {
        HStack{
            Text("\(title) :")
                .frame(maxWidth: 90, maxHeight: .infinity, alignment: .topTrailing)
                .font(.custom("KomikaAxis", size: 11))
                .bold()
                .foregroundColor(.textTitle)
            Text(description)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .font(.custom("KomikaAxis", size: 11))
                .bold()
                .foregroundColor(.textTitleApp)
        }
    }
}
