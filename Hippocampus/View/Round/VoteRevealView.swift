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
        VStack(spacing: 16) {
            Spacer()

            if isCounting {
                Text("\(countdown)")
                    .font(.custom("Helvetica-Bold", size: 120))
            } else if countdown == 0 {
                Text("My vote is:")
                    .font(.custom("Helvetica-Bold", size: 22))
                Text(vote)
                    .font(.custom("Helvetica-Bold", size: 50))
                    .multilineTextAlignment(.center)
            } else {
                Text("Vote locked")
                    .font(.custom("Helvetica-Bold", size: 30))
                Text("When everyone is ready, start the countdown\nand show your phone at 0.")
                    .font(.custom("Helvetica-Light", size: 12))
                    .multilineTextAlignment(.center)
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
        .foregroundStyle(appBlue)
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
    VoteRevealView(screen: .constant(.voteReveal), vote: "Player 1")
        .padding(30)
}
