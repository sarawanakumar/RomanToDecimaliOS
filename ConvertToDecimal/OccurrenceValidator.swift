//
//  OccurrenceValidator.swift
//  ConvertToDecimal
//
//  Created by Sarawanak on 2/28/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import Foundation


class OccurrenceValidator {

    private var list: RomanLinkedList?

    init(_ roman: RomanLinkedList) {
        list = roman
    }

    var validate: Bool {
        var digitOccCounter = 1

        var currentDigit = list?.first
        while currentDigit != nil {
            guard let cElement = currentDigit?.element,
                let nElement = currentDigit?.next?.element else {
                    return digitOccCounter <= 3
            }

            if digitOccCounter > 3 {
                return false
            }
            digitOccCounter += (cElement == nElement) ? 1 : -digitOccCounter + 1
            currentDigit = currentDigit?.next
        }
        return digitOccCounter <= 3
    }
}
