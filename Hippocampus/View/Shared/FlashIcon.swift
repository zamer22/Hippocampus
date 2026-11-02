//
//  FlashIcon.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 23/10/2026.
//

import SwiftUI

struct FlashIcon: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(appLightBlue)
                .frame(width: 150, height: 150)
            HStack(spacing: 10) {
                PhoneIcon()
                PhoneIcon(showsScreen: false)
            }
        }
    }
}

#Preview {
    FlashIcon()
}
