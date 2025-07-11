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
        XCTAssertEqual(calculator.add("//;\n1;2"), 3)
        XCTAssertEqual(calculator.add("//$\n1$2$3"), 6)
    }

}
