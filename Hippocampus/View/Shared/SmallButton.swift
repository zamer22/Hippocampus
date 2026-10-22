//
//  SmallButton.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct SmallButton: View {
    let title: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("Helvetica", size: 15))
                .foregroundStyle(appBlue)
                .padding(.horizontal, 20)
                .frame(height: 32)
                .background(appLightBlue)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(appBlue, lineWidth: 2))
                .shadow(color: .black.opacity(0.15), radius: 3, y: 3)
        }
    }
}

#Preview {
    SmallButton(title: "Give me an idea") {}
}
