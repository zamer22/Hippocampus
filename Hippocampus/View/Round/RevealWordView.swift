//
//  RevealWordView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct RevealWordView: View {
    @Binding var screen: Screen
    let word: String

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Text("My word was")
                .font(.custom("Helvetica-Light", size: 17))
            Text(word)
                .font(.custom("Helvetica-Bold", size: 56))
                .multilineTextAlignment(.center)
            Spacer()
            PillButton(title: "Vote") {
                screen = .vote
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    RevealWordView(screen: .constant(.revealWord), word: "Spider")
        .padding(30)
}
