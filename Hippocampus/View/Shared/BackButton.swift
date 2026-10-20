//
//  BackButton.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct BackButton: View {
    let action: () -> Void

    var body: some View {
        HStack {
            Button(action: action) {
                Image(systemName: "chevron.left")
                    .font(.headline)
                    .foregroundStyle(Color.black)
                    .frame(width: 44, height: 44)
                    .overlay(Circle().stroke(Color.black, lineWidth: 1.5))
            }
            Spacer()
        }
    }
}

#Preview {
    BackButton {}
        .padding(24)
}
