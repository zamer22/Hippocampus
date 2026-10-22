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
    @State private var secondsLeft = 15

    var body: some View {
        VStack(spacing: 16) {
            Spacer()

            VStack(spacing: 24) {
                Text("Loser's Punishment")
                    .font(.custom("Helvetica", size: 20))
                Text("“\(punishment)”")
                    .font(.custom("Helvetica-Bold", size: 24))
                    .multilineTextAlignment(.center)
            }
            .foregroundStyle(.white)
            .padding(24)
            .frame(maxWidth: .infinity, minHeight: 380)
            .background(appBlue)
            .clipShape(RoundedRectangle(cornerRadius: 40))
            .shadow(color: appBlue.opacity(0.5), radius: 6, y: 6)

            HStack {
                SmallButton(title: "Another one") {
                    punishment = punishments.randomElement() ?? ""
                }
                Spacer()
                ClockTimer(secondsLeft: secondsLeft)
            }
            Spacer()

            PillButton(title: "Done") {
                screen = .roundEnd
            }
            PillButton(title: "Skip", isMain: false) {
                screen = .roundEnd
            }
        }
        .foregroundStyle(appBlue)
        .task {
            while secondsLeft > 0 {
                try? await Task.sleep(for: .seconds(1))
                secondsLeft -= 1
            }
        }
    }
}

#Preview {
    PunishmentView(screen: .constant(.punishment))
        .padding(30)
}
