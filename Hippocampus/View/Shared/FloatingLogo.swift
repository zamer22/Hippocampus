//
//  FloatingLogo.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct FloatingLogo: View {
    let size: CGFloat

    @State private var isUp = false

    var body: some View {
        Image("Logo")
            .resizable()
            .frame(width: size, height: size)
            .offset(y: isUp ? -6 : 6)
            .animation(.easeInOut(duration: 2).repeatForever(), value: isUp)
            .onAppear {
                isUp = true
            }
    }
}

#Preview {
    FloatingLogo(size: 160)
}
