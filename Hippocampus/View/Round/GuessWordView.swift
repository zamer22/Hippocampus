//
//  GuessWordView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI
import PencilKit

struct GuessWordView: View {
    @Binding var screen: Screen
    let drawing: PKDrawing

    @State private var secondsLeft = 15

    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 6) {
                Text("Guess the word!")
                    .font(.custom("Helvetica-Bold", size: 22))
                    .padding(.top, 16)
                Text("Show the screen to your neighbors and\nlet them guess what's the word")
                    .font(.custom("Helvetica-Light", size: 12))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 8)

                DrawingCanvas(drawing: .constant(drawing), isLocked: true)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .overlay(alignment: .bottom) {
                        TimerPill(secondsLeft: secondsLeft)
                            .padding(.bottom, 20)
                    }
            }
            .foregroundStyle(.white)
            .background(appBlue)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(color: appBlue.opacity(0.5), radius: 4, y: 4)

            PillButton(title: "Next") {
                screen = .revealWord
            }
        }
        .task {
            while secondsLeft > 0 {
                try? await Task.sleep(for: .seconds(1))
                secondsLeft -= 1
            }
            if screen == .guessWord {
                screen = .revealWord
            }
        }
    }
}

#Preview {
    GuessWordView(screen: .constant(.guessWord), drawing: PKDrawing())
        .padding(30)
}
