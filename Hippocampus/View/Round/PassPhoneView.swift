//
//  PassPhoneView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct PassPhoneView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 30) {
            Spacer()
            Text("Pass the phone!")
                .font(.custom("Helvetica-Bold", size: 24))

            ZStack {
                Circle()
                    .fill(appLightBlue)
                    .frame(width: 110, height: 110)
                VStack(spacing: 56) {
                    Image(systemName: "iphone")
                    Image(systemName: "iphone")
                }
                HStack(spacing: 80) {
                    Image(systemName: "iphone")
                        .rotationEffect(.degrees(90))
                    Image(systemName: "iphone")
                        .rotationEffect(.degrees(90))
                }
            }
            .font(.system(size: 56))
            .frame(height: 200)

            Text("Hand it to your neighbor.\nDon't peek at the word!")
                .font(.custom("Helvetica", size: 17))
                .multilineTextAlignment(.center)
            Spacer()
            PillButton(title: "Ready to Draw") {
                screen = .draw
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    PassPhoneView(screen: .constant(.passPhone))
        .padding(30)
}
