//
//  PhoneIcon.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 23/10/2026.
//

import SwiftUI

struct PhoneIcon: View {
    var showsScreen = true

    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .stroke(appBlue, lineWidth: 5)
            .frame(width: 44, height: 84)
            .overlay {
                if showsScreen {
                    VStack {
                        Capsule()
                            .fill(appBlue)
                            .frame(width: 16, height: 5)
                        Spacer()
                        Capsule()
                            .fill(appBlue)
                            .frame(width: 16, height: 5)
                    }
                    .padding(.vertical, 11)
                }
            }
    }
}

#Preview {
    HStack {
        PhoneIcon()
        PhoneIcon(showsScreen: false)
    }
}
