//
//  IconButton.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct IconButton: View {
    let systemName: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.system(size: 20))
                .foregroundStyle(.white)
                .frame(width: 44, height: 44)
                .background(appBlue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.2), radius: 4, y: 4)
        }
    }
}

#Preview {
    HStack {
        IconButton(systemName: "chevron.left") {}
        IconButton(systemName: "xmark") {}
    }
}
