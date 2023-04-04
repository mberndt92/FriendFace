//
//  UIColor+HexString.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/04.
//

import Foundation
import SwiftUI

// Convert the hex string to a Color instance
extension Color {
    init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var hexInt: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&hexInt)
        let red, green, blue: Double
        switch hexString.count {
        case 3: // RGB (12-bit)
            (red, green, blue) = (
                Double((hexInt & 0xF00) >> 8) / 15,
                Double((hexInt & 0x0F0) >> 4) / 15,
                Double(hexInt & 0x00F) / 15
            )
        case 6: // RGB (24-bit)
            (red, green, blue) = (
                Double((hexInt & 0xFF0000) >> 16) / 255,
                Double((hexInt & 0x00FF00) >> 8) / 255,
                Double(hexInt & 0x0000FF) / 255
            )
        default:
            (red, green, blue) = (1, 1, 1)
        }
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
}
