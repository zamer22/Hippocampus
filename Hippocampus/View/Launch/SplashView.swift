//
//  SplashView.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 19/10/2026.
//

import SwiftUI

struct SplashView: View {
    @Binding var screen: Screen

    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "pencil.and.scribble")
                .font(.system(size: 64))
            Text("Hippo Campus")
                .font(.largeTitle.bold())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .task {
            try? await Task.sleep(for: .seconds(1.5))
            screen = .home
        }
    }
}

#Preview {
    SplashView(screen: .constant(.splash))
}
