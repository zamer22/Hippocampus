//
//  RoundCountView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct RoundCountView: View {
    @Binding var screen: Screen
    @Binding var roundCount: Int
    @Binding var roundNumber: Int
    @Binding var isPlaying: Bool

    var body: some View {
        VStack(spacing: 24) {
            BackButton {
                screen = .playerNames
            }
            Spacer()
            Text("How many rounds?")
                .font(.title2.bold())
            Text("\(roundCount)")
                .font(.system(size: 72, weight: .bold))
            Stepper("Rounds", value: $roundCount, in: 1...10)
                .labelsHidden()
            Spacer()
            PillButton(title: "Start") {
                roundNumber = 1
                isPlaying = true
                screen = .writeWord
            }
        }
    }
}

#Preview {
    RoundCountView(screen: .constant(.roundCount), roundCount: .constant(3), roundNumber: .constant(1), isPlaying: .constant(false))
        .padding(24)
}
