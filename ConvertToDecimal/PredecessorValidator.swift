//
//  PredecessorValidator.swift
//  ConvertToDecimal
//
//  Created by Sarawanak on 2/28/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import Foundation
class PredecessorValidator {
    var romanLiteral: [RomanNumeral]
    var list: RomanLinkedList?

    init(_ roman: [RomanNumeral]) {
        self.romanLiteral = roman
    }
    init(_ roman: RomanLinkedList) {
        list = roman
        romanLiteral = []
    }

    var negativeNumeralValidated: Bool {
        var currentDigit = list?.first?.next?.next

        while currentDigit != nil {
            var prevPrevDigit = currentDigit?.previous?.previous
            while prevPrevDigit != nil {
                if let cDigit = currentDigit,
                    let ppDigit = prevPrevDigit,
                    ppDigit.element.intValue < cDigit.element.intValue {
                    return false
                }
                prevPrevDigit = prevPrevDigit?.previous
            }
            currentDigit = currentDigit?.next
        }
        return true
    }

    //IIV - one neg occurrence
    var immediatePredecessorValidated: Bool {
        var currentDigit = list?.first?.next

        while currentDigit != nil {
            if let currentDigit = currentDigit,
                let prevDigit = currentDigit.previous,
                let vPred = currentDigit.element.validNegativePredecessor,
                prevDigit.element.intValue < currentDigit.element.intValue,
                prevDigit.element != vPred {
                return false
            }
            currentDigit = currentDigit?.next
        }
        return true
    }

    //VIV - validate
    var invalidPredecessorCheck: Bool {
        var currentDigit = list?.first?.next

        while currentDigit != nil {
            var prevDigit = currentDigit?.previous
            while prevDigit != nil {
                if let cDigit = currentDigit,
                    let pDigit = prevDigit,
                    let invalidPred = cDigit.element.invalidPredecessors,
                    invalidPred.contains(pDigit.element) {
                    return false
                }
                prevDigit = prevDigit?.previous
            }
            currentDigit = currentDigit?.next
        }
        return true
    }

    var validate: Bool {
        return negativeNumeralValidated &&
            immediatePredecessorValidated &&
        invalidPredecessorCheck
    }

    func validated() -> Bool {
        var previousDigit: RomanNumeral?
        for index in romanLiteral.indices {
            let currentDigit = romanLiteral[index]

            if let previousDigit = previousDigit,
                previousDigit.intValue <= currentDigit.intValue {
                if let validNegPredecesor = currentDigit.validNegativePredecessor,
                    previousDigit != validNegPredecesor {
                    return false
                }
                if index >= 2 {
                    let secondPrevious = romanLiteral[index - 2]
                    if secondPrevious.intValue < currentDigit.intValue {
                        return false
                    }
                }
            }

            previousDigit = romanLiteral[index]
        }
        return true
    }
}
