//
//  ColorCombination.swift
//  FriendFace
//
//  Created by Maximilian Berndt on 2023/04/05.
//

import Foundation

enum ColorCombination: String, CaseIterable {
    case whiteOnDarkSlateGray = "#FFFFFF"
    case blackOnLightGray = "#000000"
    case darkRedOnLemonChiffon = "#8B0000"
    case navyOnMintCream = "#000080"
    case forestGreenOnIvory = "#228B22"
    case darkOrangeOnLavender = "#FF8C00"
    case crimsonOnHoneydew = "#DC143C"
    case darkOrchidOnOldLace = "#9932CC"
    case dodgerBlueOnFloralWhite = "#1E90FF"
    case indigoOnPeachPuff = "#4B0082"
    
    var foregroundColor: String {
        return self.rawValue
    }
    
    var backgroundColor: String {
        switch self {
        case .whiteOnDarkSlateGray:
            return "#2F4F4F"
        case .blackOnLightGray:
            return "#D3D3D3"
        case .darkRedOnLemonChiffon:
            return "#FFFACD"
        case .navyOnMintCream:
            return "#F5FFFA"
        case .forestGreenOnIvory:
            return "#FFFFF0"
        case .darkOrangeOnLavender:
            return "#E6E6FA"
        case .crimsonOnHoneydew:
            return "#F0FFF0"
        case .darkOrchidOnOldLace:
            return "#FDF5E6"
        case .dodgerBlueOnFloralWhite:
            return "#FFFAF0"
        case .indigoOnPeachPuff:
            return "#FFDAB9"
        }
    }
}
