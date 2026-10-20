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
        VStack(spacing: 24) {
            Spacer()
            Text("My word was")
                .font(.title3)
                .foregroundStyle(.secondary)
            Text(word)
                .font(.system(size: 56, weight: .bold))
                .multilineTextAlignment(.center)
            Spacer()
            PillButton(title: "Everyone is ready to vote") {
                screen = .vote
            }
        }
    }
}

#Preview {
    RevealWordView(screen: .constant(.revealWord), word: "Lighthouse")
        .padding(24)
}
