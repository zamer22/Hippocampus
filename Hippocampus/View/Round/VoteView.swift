//
//  VoteView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct VoteView: View {
    @Binding var screen: Screen
    @Binding var vote: String
    let names: [String]
    let playerCount: Int

    @State private var secondsLeft = 20

    var body: some View {
        VStack(spacing: 16) {
            Text("Who gets the punishment?")
                .font(.custom("Helvetica-Bold", size: 22))
                .padding(.top, 24)
            Text("Pick in secret. Don't show anyone yet.")
                .font(.custom("Helvetica-Light", size: 12))
            ClockTimer(secondsLeft: secondsLeft)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<playerCount, id: \.self) { seat in
                        PillButton(title: names[seat], isMain: vote == names[seat]) {
                            vote = names[seat]
                        }
                    }
                }
                .padding(4)
            }

            PillButton(title: "Lock my vote", isMain: !vote.isEmpty) {
                screen = .voteReveal
            }
            .disabled(vote.isEmpty)

            PillButton(title: "Skip voting", isMain: false) {
                screen = .roundEnd
            }
        }
        .foregroundStyle(appBlue)
        .onAppear {
            vote = ""
        }
        .task {
            while secondsLeft > 0 {
                try? await Task.sleep(for: .seconds(1))
                secondsLeft -= 1
            }
            if screen == .vote {
                if vote.isEmpty {
                    screen = .roundEnd
                } else {
                    screen = .voteReveal
                }
            }
        }
    }
}

#Preview {
    VoteView(screen: .constant(.vote), vote: .constant("Leo"), names: ["Ana", "Leo", "Mia"], playerCount: 3)
        .padding(30)
}
