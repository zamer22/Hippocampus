//
//  RoundHeader.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct RoundHeader: View {
    @Binding var screen: Screen
    @Binding var isPlaying: Bool
    let roundNumber: Int
    let roundCount: Int
    let step: Int

    var body: some View {
        VStack(spacing: 12) {
            ZStack {
                Text("Round \(roundNumber)/\(roundCount)")
                    .font(.custom("Helvetica", size: 22))
                    .foregroundStyle(appBlue)
                HStack {
                    Spacer()
                    IconButton(systemName: "xmark") {
                        isPlaying = false
                        screen = .final
                    }
                }
            }
            ProgressBar(step: step, totalSteps: 10)
        }
    }
}

#Preview {
    RoundHeader(screen: .constant(.draw), isPlaying: .constant(true), roundNumber: 1, roundCount: 3, step: 3)
        .padding(30)
}
