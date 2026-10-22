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
            TopBar(screen: $screen, backTo: .players)
            Spacer()
            Text("How many rounds?")
                .font(.custom("Helvetica-Bold", size: 22))
            Text("\(roundCount)")
                .font(.custom("Helvetica-Bold", size: 79))
            PlusMinusControl(value: $roundCount, minimum: 1, maximum: 10)
            Spacer()
            PillButton(title: "Start") {
                roundNumber = 1
                isPlaying = true
                screen = .writeWord
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    RoundCountView(screen: .constant(.roundCount), roundCount: .constant(3), roundNumber: .constant(1), isPlaying: .constant(false))
        .padding(30)
}
