//
//  ShowDrawingView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI
import PencilKit

struct ShowDrawingView: View {
    @Binding var screen: Screen
    let drawing: PKDrawing

    var body: some View {
        VStack(spacing: 16) {
            Text("Show and talk")
                .font(.title2.bold())
            Text("Show your drawing to the group. What do they think it is?")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            DrawingCanvas(drawing: .constant(drawing), isLocked: true)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1.5))
            PillButton(title: "Continue") {
                screen = .revealWord
            }
        }
    }
}

#Preview {
    ShowDrawingView(screen: .constant(.showDrawing), drawing: PKDrawing())
        .padding(24)
}
