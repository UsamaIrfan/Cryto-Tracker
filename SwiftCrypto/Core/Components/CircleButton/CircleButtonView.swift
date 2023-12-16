//
//  CircleButtonView.swift
//  SwiftCrypto
//
//  Created by Map Mac on 28/10/2023.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(.background)
            )
            .shadow(color: Color.accent.opacity(0.25),radius: 10)
            .padding()
    }
}

#Preview("Circle Button", traits: .sizeThatFitsLayout, body: {
        CircleButtonView(iconName: "info")
})
