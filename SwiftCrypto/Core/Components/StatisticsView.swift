//
//  StatisticsView.swift
//  SwiftCrypto
//
//  Created by Map Mac on 08/11/2023.
//

import SwiftUI

struct StatisticsView: View {
    let stat: StatisticsModel
    var body: some View {
        VStack (alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.accent)
            HStack {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180)
                    )
                Text(stat.percentageChange?.asPercentageString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.customGreen : Color.customRed)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticsView_Preview: PreviewProvider {
    static var previews: some View {
        StatisticsView(stat: dev.stat3)
            .previewLayout(.sizeThatFits)
    }
}
