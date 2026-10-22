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
        VStack(spacing: 16) {
            Spacer()
            Image(systemName: "alarm")
                .font(.system(size: 64))
            Text("Time's up!")
                .font(.custom("Helvetica-Bold", size: 30))
            Text("Pencils down. Get ready to show your drawing.")
                .font(.custom("Helvetica-Light", size: 12))
                .multilineTextAlignment(.center)
            Spacer()
            PillButton(title: "Next") {
                screen = .flashScreen
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    TimesUpView(screen: .constant(.timesUp))
        .padding(30)
}
