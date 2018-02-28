//
//  ConvertToDecimalTests.swift
//  ConvertToDecimalTests
//
//  Created by Sarawanak on 2/27/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import XCTest
@testable import ConvertToDecimal

class ConvertToDecimalTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testShouldReturnValidNumberForSingleRomanNumeral() {
        //Arrange
        let numeral = "I"
        let list = RomanLinkedList(numeral)

        //Act
        let number = RomanParser(list!).parse()

        //Assert
        XCTAssert(number == 1)
    }

    func testShouldReturnValidNumberForRomanNumeralStringHavingOnlyAddition() {
        //Arrange
        let numeral = "VIII"
        let list = RomanLinkedList(numeral)

        //Act
        let number = RomanParser(list!).parse()

        //Assert
        XCTAssert(number == 8)
    }

    func testShouldReturnNilForRomanNumeralStringHavingMoreThanThreeContinousOccurrenceOfSameDigit() {
        //Arrange
        let numeral = "IIII"
        let list = RomanLinkedList(numeral)

        //Act
        let number = RomanParser(list!).parse()

        //Assert
        XCTAssertNil(number)
    }

    func testShouldReturnValidNumberForRomanNumeralWithOneSubtraction() {
        //Arrange
        let numeral = "IV"
        let list = RomanLinkedList(numeral)

        //Act
        let number = RomanParser(list!).parse()

        //Assert
        XCTAssert(number == 4)
    }

    func testShouldReturnNilForRomanNumeralWithInvalidNegativePredecessorAtSecondLevel() {
        //Arrange
        let numeral = "IIX"
        let list = RomanLinkedList(numeral)

        //Act
        let number = RomanParser(list!).parse()

        //Assert
        XCTAssertNil(number)
    }

    func testShouldReturnNilForRomanNumeralWithInvalidNegativePredecessor() {
        //Arrange
        let numeral = "IC"
        let list = RomanLinkedList(numeral)

        //Act
        let number = RomanParser(list!).parse()

        //Assert
        XCTAssertNil(number)
    }


    func testShouldReturnValidNumberForRomanNumeral() {
        //Arrange
        let numeral = "XCIX"
        let list = RomanLinkedList(numeral)

        //Act
        let number = RomanParser(list!).parse()

        //Assert
        XCTAssert(number == 99)
    }

    func testShouldReturnNilNumberForInvalidRomanNumeral() {
        //Arrange
        let numeral = "XCFIX"
        let list = RomanLinkedList(numeral)

        //Act

        //Assert
        XCTAssertNil(list)
    }
}
