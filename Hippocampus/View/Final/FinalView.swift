//
//  FinalView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct FinalView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("Thanks for playing")
                .font(.largeTitle.bold())
            Text("Nothing from this game is saved. The words and drawings are gone once you leave.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Spacer()
            PillButton(title: "Back to home") {
                screen = .home
            }
        }
    }
}

#Preview {
    FinalView(screen: .constant(.final))
        .padding(24)
}
