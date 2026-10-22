//
//  TopBar.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct TopBar: View {
    @Binding var screen: Screen
    let backTo: Screen

    var body: some View {
        HStack {
            IconButton(systemName: "chevron.left") {
                screen = backTo
            }
            Spacer()
            IconButton(systemName: "xmark") {
                screen = .home
            }
        }
    }
}

#Preview {
    TopBar(screen: .constant(.players), backTo: .home)
        .padding(30)
}
