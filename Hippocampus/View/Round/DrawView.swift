//
//  DrawView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI
import PencilKit

struct DrawView: View {
    @Binding var screen: Screen
    @Binding var drawing: PKDrawing
    let word: String

    @State private var secondsLeft = 60

    var body: some View {
        VStack(spacing: 8) {
            Text(word)
                .font(.custom("Helvetica-Bold", size: 22))
            Text("Draw the word you see.")
                .font(.custom("Helvetica-Light", size: 12))
                .padding(.bottom, 8)

            DrawingCanvas(drawing: $drawing)
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .overlay(alignment: .bottom) {
                    TimerPill(secondsLeft: secondsLeft)
                        .padding(.bottom, 20)
                }
                .shadow(color: appBlue.opacity(0.5), radius: 4, y: 4)
                .padding(.bottom, 24)

            PillButton(title: "I'm done") {
                screen = .flashScreen
            }
        }
        .foregroundStyle(appBlue)
        .onAppear {
            drawing = PKDrawing()
        }
        .task {
            while secondsLeft > 0 {
                try? await Task.sleep(for: .seconds(1))
                secondsLeft -= 1
            }
            if screen == .draw {
                screen = .timesUp
            }
        }
    }
}

#Preview {
    DrawView(screen: .constant(.draw), drawing: .constant(PKDrawing()), word: "Spider")
        .padding(30)
}
