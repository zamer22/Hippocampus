//
//  WriteWordView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct WriteWordView: View {
    @Binding var screen: Screen
    @Binding var word: String

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("Write a word for your neighbor")
                .font(.title2.bold())
                .multilineTextAlignment(.center)
            Text("Keep it secret. They will have to draw it.")
                .foregroundStyle(.secondary)
            TextField("Your word", text: $word)
                .textFieldStyle(.roundedBorder)
                .submitLabel(.done)
            PillButton(title: "Give me an idea", isMain: false) {
                word = wordIdeas.randomElement() ?? ""
            }
            Spacer()
            PillButton(title: "Done") {
                screen = .passPhone
            }
            .disabled(word.isEmpty)
            .opacity(word.isEmpty ? 0.4 : 1)
        }
        .onAppear {
            word = ""
        }
    }
}

#Preview {
    WriteWordView(screen: .constant(.writeWord), word: .constant(""))
        .padding(24)
}
