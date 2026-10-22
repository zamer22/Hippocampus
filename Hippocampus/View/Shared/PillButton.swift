//
//  PillButton.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PillButton: View {
    let title: String
    var isMain = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom("Helvetica", size: 18))
                .frame(maxWidth: .infinity)
                .frame(height: 49)
                .foregroundStyle(isMain ? Color.white : appBlue)
                .background(isMain ? appBlue : appGray)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(appBlue, lineWidth: isMain ? 0 : 1))
                .shadow(color: .black.opacity(0.2), radius: 4, y: 4)
        }
    }
}

#Preview {
    VStack {
        PillButton(title: "Main") {}
        PillButton(title: "Not main", isMain: false) {}
    }
    .padding(30)
}
