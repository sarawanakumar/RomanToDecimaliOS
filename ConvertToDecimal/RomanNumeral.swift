//
//  RomanNumeral.swift
//  ConvertToDecimal
//
//  Created by Sarawanak on 2/27/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import Foundation

enum RomanNumeral: Character {
    case I = "I"
    case V = "V"
    case X = "X"
    case L = "L"
    case C = "C"
    case D = "D"
    case M = "M"

    var intValue: Int {
        switch self {
        case .I:
            return 1
        case .V:
            return 5
        case .X:
            return 10
        case .L:
            return 50
        case .C:
            return 100
        case .D:
            return 500
        case .M:
            return 1000
        }
    }

    var validNegativePredecessor: RomanNumeral? {
        switch self {
        case .V, .X:
            return .I
        case .L, .C:
            return .X
        case .D, .M:
            return .C
        default:
            return nil
        }
    }

    var invalidPredecessors: [RomanNumeral]? {
        switch self {
        case .X, .V:
            return [.V]
        case .L, .C:
            return [.V, .L]
        case .D, .M:
            return [.V, .L, .D]
        default:
            return nil
        }
    }
}

class Number {
    var value: Int?

    init?(for roman: String) {
        guard let list = RomanLinkedList(roman) else {
            return nil
        }
        value = RomanParser(list).parse()
    }
}
