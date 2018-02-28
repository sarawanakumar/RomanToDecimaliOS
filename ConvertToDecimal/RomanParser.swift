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
        guard PredecessorValidator(romanList).validate,
            OccurrenceValidator(romanList).validate else {
                return nil
        }
        return calculateDecimal()
    }

    func calculateDecimal() -> Int? {
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
    }
}
