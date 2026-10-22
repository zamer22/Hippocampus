//
//  FinalView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct FinalView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            FloatingLogo(size: 120)
                .padding(.bottom, 16)
            Text("Thanks for playing")
                .font(.custom("Helvetica-Bold", size: 30))
            Text("Nothing from this game is saved. The words and drawings are gone once you leave.")
                .font(.custom("Helvetica-Light", size: 15))
                .multilineTextAlignment(.center)
            Spacer()
            PillButton(title: "Back to home") {
                screen = .home
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    FinalView(screen: .constant(.final))
        .padding(30)
}
