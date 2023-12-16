//
//  CoinRowView.swift
//  SwiftCrypto
//
//  Created by Map Mac on 28/10/2023.
//

import SwiftUI

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    var body: some View {
        HStack (spacing: 0) {
            leftColumns
            Spacer()
            rightColumns
        }
        .font(.subheadline)
    }
}

struct CoinRowView_Preview: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
    }
}

extension CoinRowView {
    private var leftColumns: some View {
        HStack (spacing: 0) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundStyle(.secondaryText)
                .frame(width: 30)
            
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(.accent)
        }
    }
    
    private var rightColumns: some View {
        HStack (spacing: 0) {
            if (showHoldingsColumn) {
                VStack (alignment: .trailing) {
                    Text(coin.currentHoldingValue.asCurrencyWith2Decimals())
                    Text((coin.currentHoldings ?? 0).asNumberString())
                }
            }
            
            VStack (alignment: .trailing) {
                Text(coin.currentPrice.asCurrencyWith6Decimals())
                    .bold()
                    .foregroundStyle(.accent)
                Text(coin.priceChangePercentage24H?.asPercentageString() ?? "")
                    .foregroundStyle((coin.priceChangePercentage24H ?? 0) >= 0
                                     ? Color.customGreen : Color.customRed
                    )
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
    }
}
