//
//  VoteRevealView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct VoteRevealView: View {
    @Binding var screen: Screen
    let vote: String

    @State private var countdown = 3
    @State private var isCounting = false

    var body: some View {
        VStack(spacing: 24) {
            Spacer()

            if isCounting {
                Text("\(countdown)")
                    .font(.system(size: 120, weight: .bold))
            } else if countdown == 0 {
                Text("I voted for")
                    .foregroundStyle(.secondary)
                Text(vote)
                    .font(.system(size: 56, weight: .bold))
                    .multilineTextAlignment(.center)
            } else {
                Text("Vote locked")
                    .font(.title.bold())
                Text("When everyone is ready, start the countdown and show your phone at 0.")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            if countdown == 0 {
                PillButton(title: "Give the punishment") {
                    screen = .punishment
                }
                PillButton(title: "Skip", isMain: false) {
                    screen = .roundEnd
                }
            } else if !isCounting {
                PillButton(title: "Start countdown") {
                    startCountdown()
                }
            }
        }
    }

    func startCountdown() {
        isCounting = true
        Task {
            while countdown > 0 {
                try? await Task.sleep(for: .seconds(1))
                countdown -= 1
            }
            isCounting = false
        }
    }
}

#Preview {
    VoteRevealView(screen: .constant(.voteReveal), vote: "Leo")
        .padding(24)
}
