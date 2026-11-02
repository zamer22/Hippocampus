//
//  FlashScreenView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct FlashScreenView: View {
    @Binding var screen: Screen

    @State private var secondsLeft = 5

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Text("Flash your screen!")
                .font(.custom("Helvetica-Bold", size: 24))
            Text("Turn your phone around so everyone\ncan see your drawing.")
                .font(.custom("Helvetica", size: 17))
                .multilineTextAlignment(.center)
            FlashIcon()
                .padding(.vertical, 24)
            ClockTimer(secondsLeft: secondsLeft)
            Spacer()
        }
        .foregroundStyle(appBlue)
        .task {
            while secondsLeft > 0 {
                try? await Task.sleep(for: .seconds(1))
                secondsLeft -= 1
            }
            if screen == .flashScreen {
                screen = .guessWord
            }
        }
    }
}

#Preview {
    FlashScreenView(screen: .constant(.flashScreen))
        .padding(30)
}
