//
//  UIApplication.swift
//  SwiftCrypto
//
//  Created by Map Mac on 31/10/2023.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
