//
//  PlayerNamesView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PlayerNamesView: View {
    @Binding var screen: Screen
    @Binding var names: [String]
    let playerCount: Int

    var body: some View {
        VStack(spacing: 16) {
            BackButton {
                screen = .playerCount
            }
            Text("Who's playing?")
                .font(.largeTitle.bold())
            Text("Names are forgotten when the game ends.")
                .foregroundStyle(.secondary)

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<playerCount, id: \.self) { seat in
                        TextField("Player \(seat + 1)", text: $names[seat])
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.words)
                    }
                }
            }

            PillButton(title: "Next") {
                fillEmptyNames()
                screen = .roundCount
            }
        }
    }

    func fillEmptyNames() {
        for seat in 0..<playerCount {
            let name = names[seat].trimmingCharacters(in: .whitespaces)
            if name.isEmpty {
                names[seat] = "Player \(seat + 1)"
            }
        }
    }
}

#Preview {
    PlayerNamesView(screen: .constant(.playerNames), names: .constant(Array(repeating: "", count: 10)), playerCount: 4)
        .padding(24)
}
