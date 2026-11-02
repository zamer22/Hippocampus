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

            Text("Talk it out: will they do it or skip it?")
                .font(.custom("Helvetica-Light", size: 17))
                .multilineTextAlignment(.center)
            Spacer()

            PillButton(title: "Done") {
                screen = .roundEnd
            }
            PillButton(title: "Skip", isMain: false) {
                screen = .roundEnd
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    PunishmentView(screen: .constant(.punishment))
        .padding(30)
}
