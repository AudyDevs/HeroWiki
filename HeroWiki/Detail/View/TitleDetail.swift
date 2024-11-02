//
//  TitleDetail.swift
//  HeroWiki
//
//  Created by AudyDev on 2/11/24.
//

import SwiftUI

struct TitleDetail: View {
    let title: String
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 6)
            .padding(.vertical, 6)
            .font(.custom("KomikaAxis", size: 24))
            .bold()
            .foregroundColor(.textTitle)
            .border(.textTitleApp, width: 3)
    }
}
