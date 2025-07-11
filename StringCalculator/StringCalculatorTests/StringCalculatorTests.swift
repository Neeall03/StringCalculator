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
        XCTAssertEqual(calculator.add("1\n2,3"), 6)
        XCTAssertEqual(calculator.add("10\n20\n30"), 60)
    }

}
