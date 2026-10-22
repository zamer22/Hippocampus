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
                .font(.custom("Helvetica-Bold", size: 22))
            Text("Let your neighbors see what you draw")
                .font(.custom("Helvetica-Light", size: 12))
            HStack(spacing: 4) {
                Image(systemName: "iphone")
                Image(systemName: "iphone")
            }
            .font(.system(size: 60))
            .padding(.vertical, 40)
            ClockTimer(secondsLeft: secondsLeft)
            Spacer()
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
