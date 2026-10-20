//
//  PickGameView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PickGameView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            BackButton {
                screen = .home
            }
            Text("Pick a game")
                .font(.largeTitle.bold())

            Button {
                screen = .playerCount
            } label: {
                VStack(alignment: .leading, spacing: 8) {
                    Image(systemName: "scribble.variable")
                        .font(.title)
                    Text("Draw it")
                        .font(.title2.bold())
                    Text("Write a word for your neighbor, then draw theirs.")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(20)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1.5))
            }
            .buttonStyle(.plain)

            Spacer()
        }
    }
}

#Preview {
    PickGameView(screen: .constant(.pickGame))
        .padding(24)
}
