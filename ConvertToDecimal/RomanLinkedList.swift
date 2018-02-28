//
//  RomanLinkedList.swift
//  ConvertToDecimal
//
//  Created by Sarawanak on 2/27/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import Foundation
class Roman {
    var element: RomanNumeral
    var next: Roman?
    var previous: Roman?
    init(_ e: RomanNumeral) {
        element = e
    }
}

class RomanLinkedList {
    private var head: Roman?
    private var tail: Roman?

    var first: Roman? {
        return head
    }

    init?(_ roman: String) {
        do {
            try createRoman(roman)
        } catch  {
            return nil
        }
    }

    func createRoman(_ roman: String) throws {

        for char in roman {
            if let roman = RomanNumeral(rawValue: char) {
                append(roman)
            } else {
                throw RError.e
            }
        }
    }

    func append(_ el: RomanNumeral) {
        let roman = Roman(el)

        if let tNode = tail {
            tNode.next = roman
            roman.previous = tNode
        } else {
            head = roman
        }

        tail = roman
    }
}

enum RError: Error {
    case e
}
