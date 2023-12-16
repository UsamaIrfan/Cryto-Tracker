//
//  String.swift
//  SwiftCrypto
//
//  Created by Map Mac on 29/11/2023.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
