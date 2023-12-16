//
//  MarketDataModel.swift
//  SwiftCrypto
//
//  Created by Map Mac on 12/11/2023.
//

// Market Data Coin Gecko API info
/*
 
 URL: https://api.coingecko.com/api/v3/global
 
 JSON RESPONSE:
 {
   "data": {
     "active_cryptocurrencies": 10892,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 929,
     "total_market_cap": {
       "btc": 39637938.13345616,
       "eth": 717791607.9801426,
       "ltc": 19395439935.98607,
       "bch": 6180535503.795812,
       "bnb": 5899932936.706847,
       "eos": 1984183983606.1494,
       "xrp": 2205413764257.2036,
       "xlm": 11667333204674.666,
       "link": 91358006930.32318,
       "dot": 253081536078.59677,
       "yfi": 162959311.18426776,
       "usd": 1469685377929.4656,
       "aed": 5398154393134.91,
       "ars": 512505144519487.44,
       "aud": 2310492382642.9126,
       "bdt": 161445247399480.97,
       "bhd": 552049100399.3756,
       "bmd": 1469685377929.4656,
       "brl": 7210717369735.341,
       "cad": 2028386274349.3516,
       "chf": 1326961291507.978,
       "clp": 1344325624248215.8,
       "cny": 10712683688265.668,
       "czk": 33740302063815.715,
       "dkk": 10256640315494.164,
       "eur": 1371604454547.9663,
       "gbp": 1202393698245.434,
       "hkd": 11476993569057.875,
       "huf": 517965854601048.25,
       "idr": 23065315805493910,
       "ils": 5662721276128.288,
       "inr": 122416341290601.56,
       "jpy": 222694076890762.1,
       "krw": 1940234545381143.5,
       "kwd": 452200145508.2256,
       "lkr": 479617443685541.44,
       "mmk": 3075282409648102,
       "mxn": 25934803021632.312,
       "myr": 6919278759291.932,
       "ngn": 1175969015284572.2,
       "nok": 16236062624027.057,
       "nzd": 2496773534610.095,
       "php": 82185539706819.31,
       "pkr": 414573247235308.94,
       "pln": 6090508477823.719,
       "rub": 135475599607223.4,
       "sar": 5512858927826.191,
       "sek": 16017660028439.855,
       "sgd": 2000094830824.2107,
       "thb": 52633266323119.945,
       "try": 41971861427375.37,
       "twd": 47560194578099.77,
       "uah": 52876034832587.53,
       "vef": 147159596892.0775,
       "vnd": 35750078467642630,
       "zar": 27530881342063.703,
       "xdr": 1113973016853.062,
       "xag": 66026570898.97693,
       "xau": 758357655.0116059,
       "bits": 39637938133456.164,
       "sats": 3963793813345616.5
     },
     "total_volume": {
       "btc": 1813870.5080564597,
       "eth": 32846840.424998675,
       "ltc": 887554150.0724894,
       "bch": 282827301.37440675,
       "bnb": 269986655.64722633,
       "eos": 90798184262.34985,
       "xrp": 100921873675.1462,
       "xlm": 533908487781.929,
       "link": 4180631038.0676184,
       "dot": 11581256645.615711,
       "yfi": 7457176.192543929,
       "usd": 67254228869.63945,
       "aed": 247024782638.18494,
       "ars": 23452732675983.3,
       "aud": 105730373205.96016,
       "bdt": 7387891164717.947,
       "bhd": 25262302464.92936,
       "bmd": 67254228869.63945,
       "brl": 329969423103.1122,
       "cad": 92820923974.43286,
       "chf": 60723036195.65096,
       "clp": 61517644909745.8,
       "cny": 490222799653.68884,
       "czk": 1543988959274.748,
       "dkk": 469353812435.4402,
       "eur": 62765950651.79525,
       "gbp": 55022702265.11813,
       "hkd": 525198361377.34436,
       "huf": 23702620067619.082,
       "idr": 1055491230591564.1,
       "ils": 259131619902.38318,
       "inr": 5601890553024.974,
       "jpy": 10190697029472.11,
       "krw": 88787015326831.95,
       "kwd": 20693117409.75492,
       "lkr": 21947759576231.48,
       "mmk": 140727906886187.9,
       "mxn": 1186801749748.0923,
       "myr": 316632909518.2629,
       "ngn": 53813483134040.445,
       "nok": 742977978862.7114,
       "nzd": 114254779460.95813,
       "php": 3760890038250.4443,
       "pkr": 18971274036946.44,
       "pln": 278707577316.3841,
       "rub": 6199494884457.588,
       "sar": 252273773438.77457,
       "sek": 732983664181.539,
       "sgd": 91526280068.69237,
       "thb": 2408549334850.687,
       "try": 1920673102496.4773,
       "twd": 2176400649604.6248,
       "uah": 2419658657392.2754,
       "vef": 6734165936.717004,
       "vnd": 1635958277517678.2,
       "zar": 1259839842300.5203,
       "xdr": 50976486093.63394,
       "xag": 3021439947.2173185,
       "xau": 34703182.096734025,
       "bits": 1813870508056.4597,
       "sats": 181387050805645.97
     },
     "market_cap_percentage": {
       "btc": 49.29694612385619,
       "eth": 16.764481043875847,
       "usdt": 5.904582021842614,
       "bnb": 2.6096109174041917,
       "xrp": 2.432985743271134,
       "sol": 1.730970946162617,
       "usdc": 1.6475870887591844,
       "steth": 1.2513378006419753,
       "ada": 0.9208262651014144,
       "doge": 0.7646643112221456
     },
     "market_cap_change_percentage_24h_usd": 0.7342358946000412,
     "updated_at": 1699790745
   }
 }
 
 */

import Foundation

// MARK: - GlobalData
struct GlobalData: Codable {
    let data: MarketDataModel?
}

// MARK: - MarketDataModel
struct MarketDataModel: Codable {
    let activeCryptocurrencies, upcomingIcos, ongoingIcos, endedIcos: Int?
    let markets: Int?
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    let updatedAt: Int?

    enum CodingKeys: String, CodingKey {
        case activeCryptocurrencies = "active_cryptocurrencies"
        case upcomingIcos = "upcoming_icos"
        case ongoingIcos = "ongoing_icos"
        case endedIcos = "ended_icos"
        case markets
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
        case updatedAt = "updated_at"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: {$0.key == "usd"}) {
            return "$" + "\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: {$0.key == "usd"}) {
            return "$" + "\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
        
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: {$0.key == "btc"}) {
            return "\(item.value.asPercentageString())"
        }
        return ""
    }
}
