//
//  ProgressBar.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct ProgressBar: View {
    let step: Int
    let totalSteps: Int

    var body: some View {
        HStack(spacing: 4) {
            ForEach(1...totalSteps, id: \.self) { number in
                Capsule()
                    .fill(number <= step ? appBlue : appLightBlue)
                    .frame(height: 8)
            }
        }
    }
}

#Preview {
    ProgressBar(step: 4, totalSteps: 10)
        .padding(30)
}
