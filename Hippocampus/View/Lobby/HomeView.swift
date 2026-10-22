//
//  HomeView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct HomeView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 16) {
            Spacer()
            FloatingLogo(size: 150)
            Text("Whatsit?")
                .font(.custom("Helvetica-Bold", size: 40))
            Text("Write it. Draw it. Guess it.")
                .font(.custom("Helvetica-Light", size: 17))
            Spacer()

            VStack(alignment: .leading, spacing: 16) {
                Text("Draw, and Guess the Drawings!")
                    .font(.custom("Helvetica-Bold", size: 22))
                Text("Write a word for your neighbor, then draw theirs.")
                    .font(.custom("Helvetica", size: 15))
            }
            .foregroundStyle(.white)
            .padding(22)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(appBlue)
            .clipShape(RoundedRectangle(cornerRadius: 26))
            .shadow(color: .black.opacity(0.25), radius: 10, y: 8)

            Spacer()
            PillButton(title: "Play") {
                screen = .players
            }
        }
        .foregroundStyle(appBlue)
    }
}

#Preview {
    HomeView(screen: .constant(.home))
        .padding(30)
}
