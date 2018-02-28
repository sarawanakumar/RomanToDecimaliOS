//
//  RomanParser.swift
//  ConvertToDecimal
//
//  Created by Sarawanak on 2/27/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import Foundation

class RomanParser {
    var romanList: RomanLinkedList

    init(_ list: RomanLinkedList) {
        self.romanList = list
    }

    func parse() -> Int? {

//        guard let romanDigitArray = getRomanDigitArray(roman),
//            OccurrenceValidator(romanDigitArray).validated(),
//            PredecessorValidator(romanDigitArray).validated() else {
//            return nil
//        }



//        return calculateDecimal(from: romanDigitArray)

        guard PredecessorValidator(romanList).validate,
            OccurrenceValidator(romanList).validate else {
                return nil
        }
        return calculateDecimal1()
    }

    func getRomanDigitArray(_ roman: String) -> [RomanNumeral]? {
        var romanDigitArray = [RomanNumeral]()

        for char in roman {
            if let roman = RomanNumeral(rawValue: char) {
                romanDigitArray.append(roman)
            } else {
                return nil
            }
        }
        return romanDigitArray
    }

    func calculateDecimal(from roman: [RomanNumeral]) -> Int? {
        var accumulator = 0

        var previousDigit: RomanNumeral?

        for index in roman.indices {
            let currentDigit = roman[index]
            accumulator += currentDigit.intValue

            if let predecessor = currentDigit.validNegativePredecessor,
                let previousDigit = previousDigit,
                predecessor == previousDigit {
                accumulator -= 2 * previousDigit.intValue
            }
            previousDigit = currentDigit
        }

        return accumulator
    }

    func calculateDecimal1() -> Int? {
        var accumulator = 0
        var currentDigit = romanList.first

        while currentDigit != nil {
            guard let cDigit = currentDigit else { return nil }

            accumulator += cDigit.element.intValue
            if let predecessor = cDigit.element.validNegativePredecessor,
                let previousDigit = cDigit.previous?.element,
                predecessor == previousDigit {
                accumulator -= 2 * previousDigit.intValue
            }
            currentDigit = currentDigit?.next
        }
        return accumulator
        /*var previousDigit: RomanNumeral?

        for index in roman.indices {
            let currentDigit = roman[index]
            accumulator += currentDigit.intValue

            if let predecessor = currentDigit.validNegativePredecessor,
                let previousDigit = previousDigit,
                predecessor == previousDigit {
                accumulator -= 2 * previousDigit.intValue
            }
            previousDigit = currentDigit
        }

        return accumulator*/
    }
}
