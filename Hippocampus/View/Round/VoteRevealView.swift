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

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            if countdown > 0 {
                Text("\(countdown)")
                    .font(.custom("Helvetica-Bold", size: 120))
            } else {
                Text("My vote is:")
                    .font(.custom("Helvetica-Bold", size: 22))
                Text(vote)
                    .font(.custom("Helvetica-Bold", size: 50))
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
            }
        }
        .foregroundStyle(appBlue)
        .task {
            while countdown > 0 {
                try? await Task.sleep(for: .seconds(1))
                countdown -= 1
            }
        }
    }
}

#Preview {
    VoteRevealView(screen: .constant(.voteReveal), vote: "Player 1")
        .padding(30)
}
