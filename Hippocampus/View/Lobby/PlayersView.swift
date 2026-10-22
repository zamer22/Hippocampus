//
//  PlayersView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PlayersView: View {
    @Binding var screen: Screen
    @Binding var playerCount: Int
    @Binding var names: [String]

    var body: some View {
        VStack(spacing: 16) {
            TopBar(screen: $screen, backTo: .home)

            Text("How many players?")
                .font(.custom("Helvetica-Bold", size: 22))
            Text("\(playerCount)")
                .font(.custom("Helvetica-Bold", size: 79))
            PlusMinusControl(value: $playerCount, minimum: 2, maximum: 10)

            Text("Who is playing?")
                .font(.custom("Helvetica-Bold", size: 22))
                .padding(.top, 16)
            Text("Names are forgotten when the game is finished.")
                .font(.custom("Helvetica-Light", size: 12))

            ScrollView {
                VStack(spacing: 12) {
                    ForEach(0..<playerCount, id: \.self) { seat in
                        AppTextField(placeholder: "Player \(seat + 1)", text: $names[seat])
                            .textInputAutocapitalization(.words)
                    }
                }
                .padding(4)
            }

            PillButton(title: "Next") {
                fillEmptyNames()
                screen = .roundCount
            }
        }
        .foregroundStyle(appBlue)
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
    PlayersView(screen: .constant(.players), playerCount: .constant(3), names: .constant(Array(repeating: "", count: 10)))
        .padding(30)
}
