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
            .font(.custom("Helvetica", size: 15).monospacedDigit())
            .foregroundStyle(appBlue)
            .padding(.horizontal, 14)
            .frame(height: 32)
            .background(appLightBlue)
            .clipShape(Capsule())
    }
}

#Preview {
    TimerPill(secondsLeft: 15)
}
