//
//  Routes.swift
//  SwiftCrypto
//
//  Created by Map Mac on 19/11/2023.
//

import Foundation

enum AppRoutes: Hashable {
    case home
    case coinDetail(coin: CoinModel)
    
    func hash(into hasher: inout Hasher) {
        switch self {
        case .home:
            hasher.combine(0)
        case .coinDetail(_):
            hasher.combine(1)
        }
    }
}
