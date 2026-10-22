//
//  AppTextField.swift
//  Hippocampus
//
//  Created by Angel Aaron Munoz Alvarez on 22/10/2026.
//

import SwiftUI

struct AppTextField: View {
    let placeholder: String
    @Binding var text: String

    var body: some View {
        TextField(placeholder, text: $text)
            .font(.custom("Helvetica-Light", size: 17))
            .foregroundStyle(appBlue)
            .padding(.horizontal, 20)
            .frame(height: 49)
            .background(appLightBlue)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(appBlue, lineWidth: 2))
    }
}

#Preview {
    AppTextField(placeholder: "your word…", text: .constant(""))
        .padding(30)
}
