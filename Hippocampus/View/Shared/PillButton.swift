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
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .foregroundStyle(isMain ? Color.white : Color.black)
                .background(isMain ? Color.black : Color.clear)
                .clipShape(Capsule())
                .overlay(Capsule().stroke(Color.black, lineWidth: 1.5))
        }
    }
}

#Preview {
    VStack {
        PillButton(title: "Main") {}
        PillButton(title: "Not main", isMain: false) {}
    }
    .padding(24)
}
