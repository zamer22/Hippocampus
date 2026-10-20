//
//  HomeView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct HomeView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Text("Hippo Campus")
                .font(.largeTitle.bold())
            Text("Meet someone new through a quick game.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Spacer()
            PillButton(title: "Play") {
                screen = .pickGame
            }
        }
    }
}

#Preview {
    HomeView(screen: .constant(.home))
        .padding(24)
}
