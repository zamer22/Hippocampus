//
//  PlayerCountView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PlayerCountView: View {
    @Binding var screen: Screen
    @Binding var playerCount: Int

    var body: some View {
        VStack(spacing: 24) {
            BackButton {
                screen = .pickGame
            }
            Spacer()
            Text("How many players?")
                .font(.title2.bold())
            Text("\(playerCount)")
                .font(.system(size: 72, weight: .bold))
            Stepper("Players", value: $playerCount, in: 2...10)
                .labelsHidden()
            Spacer()
            PillButton(title: "Next") {
                screen = .playerNames
            }
        }
    }
}

#Preview {
    PlayerCountView(screen: .constant(.playerCount), playerCount: .constant(3))
        .padding(24)
}
