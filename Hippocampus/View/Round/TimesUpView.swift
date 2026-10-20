//
//  TimesUpView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct TimesUpView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: "alarm")
                .font(.system(size: 64))
            Text("Time's up!")
                .font(.largeTitle.bold())
            Text("Pencils down. Get ready to show your drawing.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Spacer()
            PillButton(title: "Show my drawing") {
                screen = .showDrawing
            }
        }
    }
}

#Preview {
    TimesUpView(screen: .constant(.timesUp))
        .padding(24)
}
