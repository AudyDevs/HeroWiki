//
//  TitleFrameDetail.swift
//  HeroWiki
//
//  Created by AudyDev on 2/11/24.
//

import SwiftUI

struct TitleFrameDetail: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.custom("KomikaAxis", size: 12))
            .bold()
            .foregroundColor(.backgroundApp)
            .padding(.vertical, 6)
            .padding(.horizontal, 24)
            .background(.textTitleApp)
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
}
