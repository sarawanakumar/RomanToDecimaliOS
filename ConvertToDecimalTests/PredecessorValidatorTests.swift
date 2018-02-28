//
//  PredecessorValidatorTests.swift
//  ConvertToDecimalTests
//
//  Created by Sarawanak on 2/28/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import XCTest
@testable import ConvertToDecimal

class PredecessorValidatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
 
    func testShouldReturnFalseForNegativeNumeralsAtSecondLevel() {
        //Arrange
        let numeral = "LXC"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertFalse(predVal.negativeNumeralValidated)
    }

    func testShouldReturnTrueForValidNumeral() {
        //Arrange XCXX
        let numeral = "CXXXII"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertTrue(predVal.negativeNumeralValidated)
    }

    func testShouldReturnTrueForValidImmPredecessor() {
        //Arrange XCXX
        let numeral = "IXCM"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertTrue(predVal.immediatePredecessorValidated)
    }

    func testShouldReturnFalseForInvalidImmPredecessor() {
        //Arrange
        let numeral = "CXXXM"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertFalse(predVal.immediatePredecessorValidated)
    }

    func testShouldReturnFalseForInvalidPredecessor() {
        //Arrange
        let numeral = "LCCCM"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertFalse(predVal.invalidPredecessorCheck)
    }

    func testShouldReturnFalseForInvalidPredecessorD() {
        //Arrange
        let numeral = "DMMMD"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertFalse(predVal.invalidPredecessorCheck)
    }

    func testShouldReturnFalseForCompartiveCheck() {
        //Arrange
        let numeral = "CMC"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertFalse(predVal.comparitiveValidationCheck)
    }

    func testShouldReturnTrueForCompartiveCheck() {
        //Arrange
        let numeral = "CMI"
        let list = RomanLinkedList(numeral)
        let predVal = PredecessorValidator(list!)

        //Act

        //Assert
        XCTAssertTrue(predVal.comparitiveValidationCheck)
    }
}
