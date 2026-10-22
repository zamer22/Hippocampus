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
        VStack(spacing: 16) {
            Spacer()
            if roundNumber == roundCount {
                Text("That was the last round")
                    .font(.custom("Helvetica-Bold", size: 30))
                    .multilineTextAlignment(.center)
            } else {
                Text("Round over")
                    .font(.custom("Helvetica-Bold", size: 30))
                Text("Same players, new words.")
                    .font(.custom("Helvetica-Light", size: 12))
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
        .foregroundStyle(appBlue)
    }
}

#Preview {
    RoundEndView(screen: .constant(.roundEnd), roundNumber: .constant(1), isPlaying: .constant(true), roundCount: 3)
        .padding(30)
}
