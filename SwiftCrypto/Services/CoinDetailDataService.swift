//
//  CoinDataService.swift
//  SwiftCrypto
//
//  Created by Map Mac on 29/10/2023.
//

import Foundation
import Combine

class CoinDetailDataService {
    @Published var coinDetail: CoinDetailModel? = nil
    let coin: CoinModel
    private var coinSubscription: AnyCancellable?
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoins()
    }
    
    func getCoins() {
        
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else {return}
        
        coinSubscription = NetworkingManager.get(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCoin in
                self?.coinDetail = returnedCoin
                self?.coinSubscription?.cancel()
            })
    }
}
