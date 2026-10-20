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

    var body: some View {
        HStack {
            Text("Round \(roundNumber) of \(roundCount)")
                .font(.headline)
            Spacer()
            Button("End") {
                isPlaying = false
                screen = .final
            }
        }
        .padding(.bottom, 8)
    }
}

#Preview {
    RoundHeader(screen: .constant(.draw), isPlaying: .constant(true), roundNumber: 1, roundCount: 3)
        .padding(24)
}
