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
        VStack(spacing: 16) {
            HStack {
                Text(word)
                    .font(.title2.bold())
                Spacer()
                TimerPill(secondsLeft: secondsLeft)
            }
            DrawingCanvas(drawing: $drawing)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1.5))
            PillButton(title: "I'm done") {
                screen = .showDrawing
            }
        }
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
    DrawView(screen: .constant(.draw), drawing: .constant(PKDrawing()), word: "Lighthouse")
        .padding(24)
}
