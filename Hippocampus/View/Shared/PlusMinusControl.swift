//
//  PlusMinusControl.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct PlusMinusControl: View {
    @Binding var value: Int
    let minimum: Int
    let maximum: Int

    var body: some View {
        HStack(spacing: 0) {
            Button {
                if value > minimum {
                    value -= 1
                }
            } label: {
                Image(systemName: "minus")
                    .frame(width: 60, height: 36)
                    .contentShape(Rectangle())
            }

            Rectangle()
                .fill(.white)
                .frame(width: 1, height: 36)

            Button {
                if value < maximum {
                    value += 1
                }
            } label: {
                Image(systemName: "plus")
                    .frame(width: 60, height: 36)
                    .contentShape(Rectangle())
            }
        }
        .font(.system(size: 18, weight: .bold))
        .foregroundStyle(.white)
        .background(appBlue)
        .clipShape(Capsule())
        .shadow(color: .black.opacity(0.2), radius: 4, y: 4)
    }
}

#Preview {
    PlusMinusControl(value: .constant(3), minimum: 2, maximum: 10)
}
