//
//  OccurrenceValidatorTests.swift
//  ConvertToDecimalTests
//
//  Created by Sarawanak on 2/28/18.
//  Copyright © 2018 Sarawanak. All rights reserved.
//

import XCTest
@testable import ConvertToDecimal

class OccurrenceValidatorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testShouldReturnTrueForUniqueCharRoman() {
        //Arrange
        let numeral = "IC"
        let list = RomanLinkedList(numeral)
        let occVal = OccurrenceValidator(list!)
        
        //Act

        //Assert
        XCTAssertTrue(occVal.validate)
    }

    func testShouldReturnFalseForInvalidOccurrencesInTheMiddle() {
        //Arrange
        let numeral = "IXXXXC"
        let list = RomanLinkedList(numeral)
        let occVal = OccurrenceValidator(list!)

        //Act

        //Assert
        XCTAssertFalse(occVal.validate)
    }

    func testShouldReturnFalseForInvalidOccurrencesInTheEnd() {
        //Arrange
        let numeral = "IXCCCC"
        let list = RomanLinkedList(numeral)
        let occVal = OccurrenceValidator(list!)

        //Act

        //Assert
        XCTAssertFalse(occVal.validate)
    }

    func testShouldReturnTrueForValidOccurrences() {
        //Arrange
        let numeral = "IXCVCCIXXMD"
        let list = RomanLinkedList(numeral)
        let occVal = OccurrenceValidator(list!)

        //Act

        //Assert
        XCTAssertTrue(occVal.validate)
    }
    
}
