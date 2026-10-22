//
//  ClockTimer.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct ClockTimer: View {
    let secondsLeft: Int

    var body: some View {
        HStack(spacing: 6) {
            Text("00")
                .frame(width: 32, height: 32)
                .background(appLightBlue)
                .clipShape(Circle())
            Text(":")
            Text(secondsLeft < 10 ? "0\(secondsLeft)" : "\(secondsLeft)")
                .frame(width: 32, height: 32)
                .background(appLightBlue)
                .clipShape(Circle())
        }
        .font(.custom("Helvetica", size: 15).monospacedDigit())
        .foregroundStyle(appBlue)
    }
}

#Preview {
    ClockTimer(secondsLeft: 15)
}
