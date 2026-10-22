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

    @State private var secondsLeft = 15

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            Text("Write a word for your neighbor.")
                .font(.custom("Helvetica-Bold", size: 22))
                .multilineTextAlignment(.center)
            Text("Keep it secret. They have to draw it.")
                .font(.custom("Helvetica-Light", size: 12))
            AppTextField(placeholder: "your word…", text: $word)
                .submitLabel(.done)
            HStack {
                SmallButton(title: "Give me an idea") {
                    word = wordIdeas.randomElement() ?? ""
                }
                Spacer()
            }
            ClockTimer(secondsLeft: secondsLeft)
                .padding(.top, 70)
            Spacer()
            PillButton(title: "Next", isMain: !word.isEmpty) {
                goToPassPhone()
            }
            .disabled(word.isEmpty)
        }
        .foregroundStyle(appBlue)
        .onAppear {
            word = ""
        }
        .task {
            while secondsLeft > 0 {
                try? await Task.sleep(for: .seconds(1))
                secondsLeft -= 1
            }
            if screen == .writeWord {
                goToPassPhone()
            }
        }
    }

    func goToPassPhone() {
        if word.isEmpty {
            word = wordIdeas.randomElement() ?? ""
        }
        screen = .passPhone
    }
}

#Preview {
    WriteWordView(screen: .constant(.writeWord), word: .constant(""))
        .padding(30)
}
