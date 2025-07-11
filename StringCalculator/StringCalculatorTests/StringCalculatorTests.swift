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
        XCTAssertEqual(calculator.add("-1,2,-3"),2)
        
    }
    //Equatable for easier comparison
    enum CalculatorError: Error, Equatable {
        case negativeNumbersNotAllowed(String)
    }

    func negativeNumbers() {
        let calculator = StringCalculator()
        XCTAssertThrowsError(try calculator.add("-1")) { error in
            XCTAssertEqual(error as? CalculatorError, .negativeNumbersNotAllowed("-1"))
        }
        XCTAssertThrowsError(try calculator.add("1,-2,3,-4")) { error in
            XCTAssertEqual(error as? CalculatorError, .negativeNumbersNotAllowed("-2, -4"))
        }
    }

}
