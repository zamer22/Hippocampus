//
//  RoundEndView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct RoundEndView: View {
    @Binding var screen: Screen
    @Binding var roundNumber: Int
    @Binding var isPlaying: Bool
    let roundCount: Int

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            if roundNumber == roundCount {
                Text("That was the last round")
                    .font(.title.bold())
            } else {
                Text("Round over")
                    .font(.title.bold())
            }
            Spacer()

            if roundNumber < roundCount {
                PillButton(title: "Next round") {
                    roundNumber += 1
                    screen = .writeWord
                }
            }
            PillButton(title: "Finish", isMain: roundNumber == roundCount) {
                isPlaying = false
                screen = .final
            }
        }
    }
}

#Preview {
    RoundEndView(screen: .constant(.roundEnd), roundNumber: .constant(1), isPlaying: .constant(true), roundCount: 3)
        .padding(24)
}
