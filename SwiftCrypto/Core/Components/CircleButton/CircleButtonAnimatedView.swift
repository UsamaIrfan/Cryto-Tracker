//
//  CircleButtonAnimatedView.swift
//  SwiftCrypto
//
//  Created by Map Mac on 28/10/2023.
//

import SwiftUI

struct CircleButtonAnimatedView: View {
    @Binding var animate: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5.0)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? Animation.easeInOut(duration: 1.0) : .none, value: animate)
    }
}

#Preview {
    CircleButtonAnimatedView(animate: .constant(true))
        .foregroundStyle(.red)
        .frame(width: 100, height: 100)
}
