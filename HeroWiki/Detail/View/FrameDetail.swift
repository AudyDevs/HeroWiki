//
//  FrameDetail.swift
//  HeroWiki
//
//  Created by AudyDev on 2/11/24.
//

import SwiftUI

struct FrameDetail: View {
    let title: String
    let diccionary: [(String, String)]
    var body: some View {
        VStack() {
            TitleFrameDetail(title: title)
            ForEach(diccionary, id: \.0) { key, value in
                ItemFrameDetail(title: key, description: value)
            }
        }.frame(maxWidth: .infinity)
            .padding(8)
            .foregroundColor(.backgroundApp)
            .border(.textTitleApp, width: 3)
    }
}
