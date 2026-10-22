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
                .font(.custom("Helvetica-Bold", size: 22))

            ZStack {
                Circle()
                    .fill(appLightBlue)
                    .frame(width: 97, height: 97)
                VStack(spacing: 50) {
                    Image(systemName: "iphone")
                    Image(systemName: "iphone")
                }
                HStack(spacing: 70) {
                    Image(systemName: "iphone")
                        .rotationEffect(.degrees(90))
                    Image(systemName: "iphone")
                        .rotationEffect(.degrees(90))
                }
            }
            .font(.system(size: 50))

            Text("Hand it to your neighbor.\nThe word stays hidden until they tap.")
                .font(.custom("Helvetica-Light", size: 12))
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
