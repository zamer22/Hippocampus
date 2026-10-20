//
//  PunishmentView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PunishmentView: View {
    @Binding var screen: Screen

    @State private var punishment = punishments.randomElement() ?? ""

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("Punishment for the most voted")
                .font(.title2.bold())
                .multilineTextAlignment(.center)
            Text(punishment)
                .font(.title3)
                .multilineTextAlignment(.center)
                .padding(20)
                .frame(maxWidth: .infinity)
                .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.black, lineWidth: 1.5))
            Button("Another one") {
                pickAnotherPunishment()
            }
            .foregroundStyle(.secondary)
            Spacer()
            PillButton(title: "Done") {
                screen = .roundEnd
            }
            PillButton(title: "Skip", isMain: false) {
                screen = .roundEnd
            }
        }
    }

    func pickAnotherPunishment() {
        var newPunishment = punishment
        while newPunishment == punishment {
            newPunishment = punishments.randomElement() ?? ""
        }
        punishment = newPunishment
    }
}

#Preview {
    PunishmentView(screen: .constant(.punishment))
        .padding(24)
}
