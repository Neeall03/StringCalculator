//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Nilaykumar Sevak on 7/11/25.
//

import XCTest
@testable import StringCalculator

final class StringCalculatorTests: XCTestCase {

    //To check empty string
    func testEmptyString(){
        let calculator = StringCalculator()
        XCTAssertEqual(calculator.add(""), 0)
        XCTAssertEqual(calculator.add("7"), 7)
        XCTAssertEqual(calculator.add("9"), 9)
    }

}
