//
//  TimerPill.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct TimerPill: View {
    let secondsLeft: Int

    var body: some View {
        Text("\(secondsLeft)s")
            .font(.subheadline.monospacedDigit())
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .overlay(Capsule().stroke(Color.black))
    }
}

#Preview {
    TimerPill(secondsLeft: 42)
}
