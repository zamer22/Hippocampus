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
            HStack {
                Text("Who gets the punishment?")
                    .font(.title2.bold())
                Spacer()
                TimerPill(secondsLeft: secondsLeft)
            }
            Text("Pick in secret. Don't show anyone yet.")
                .foregroundStyle(.secondary)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<playerCount, id: \.self) { seat in
                        PillButton(title: names[seat], isMain: vote == names[seat]) {
                            vote = names[seat]
                        }
                    }
                }
            }

            PillButton(title: "Lock my vote") {
                screen = .voteReveal
            }
            .disabled(vote.isEmpty)
            .opacity(vote.isEmpty ? 0.4 : 1)

            Button("Skip voting") {
                screen = .roundEnd
            }
            .foregroundStyle(.secondary)
        }
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
        .padding(24)
}
