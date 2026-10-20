//
//  PassPhoneView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PassPhoneView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 24) {
            Spacer()
            Image(systemName: "iphone.gen3.radiowaves.left.and.right")
                .font(.system(size: 56))
            Text("Pass the phone")
                .font(.title.bold())
            Text("Hand it to your neighbor. The word stays hidden until they tap.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
            Spacer()
            PillButton(title: "I'm ready to draw") {
                screen = .draw
            }
        }
    }
}

#Preview {
    PassPhoneView(screen: .constant(.passPhone))
        .padding(24)
}
