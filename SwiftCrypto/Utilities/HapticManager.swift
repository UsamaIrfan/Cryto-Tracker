//
//  HapticManager.swift
//  SwiftCrypto
//
//  Created by Map Mac on 15/11/2023.
//

import Foundation
import SwiftUI

class HapticManager {
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
