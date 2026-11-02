//
//  FlashVoteView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 23/10/2026.
//

import SwiftUI

struct FlashVoteView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Text("Get ready to flash!")
                .font(.custom("Helvetica-Bold", size: 24))
            Text("When the countdown hits 0, everyone\nturns their phone around at the same time.")
                .font(.custom("Helvetica", size: 17))
                .multilineTextAlignment(.center)
            FlashIcon()
                .padding(.vertical, 24)
            Spacer()
            PillButton(title: "Start countdown") {
                screen = .voteReveal
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    FlashVoteView(screen: .constant(.flashVote))
        .padding(30)
}
