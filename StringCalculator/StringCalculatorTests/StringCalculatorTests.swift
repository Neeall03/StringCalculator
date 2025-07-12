//
//  StringCalculatorTests.swift
//  StringCalculatorTests
//
//  Created by Nilaykumar Sevak on 7/11/25.
//

import XCTest
@testable import StringCalculator

final class StringCalculatorTests: XCTestCase {

    var calculator: StringCalculator!
       
       override func setUp() {
           super.setUp()
           calculator = StringCalculator()
       }
       override func tearDown() {
           calculator = nil
           super.tearDown()
       }
       
       // Empty string
       func testEmptyString_ReturnsZero() {
           let result = calculator.add("")
           XCTAssertEqual(result, 0)
       }
       
       // Single number
       func testSingleNumber_ReturnsNumber() {
           XCTAssertEqual(calculator.add("1"), 1)
           XCTAssertEqual(calculator.add("5"), 5)
       }
       
       //  Two numbers
       func testTwoNumbers_ReturnsSum() {
           XCTAssertEqual(calculator.add("1,2"), 3)
           XCTAssertEqual(calculator.add("1,5"), 6)
           XCTAssertEqual(calculator.add("10,20"), 30)
       }
       
       //  Any number of inputs
       func testMultipleNumbers_ReturnsSum() {
           XCTAssertEqual(calculator.add("1,2,3"), 6)
           XCTAssertEqual(calculator.add("1,2,3,4,5"), 15)
           XCTAssertEqual(calculator.add("10,20,30,40"), 100)
       }
       
       //  Handle newlines
       func testNewLineDelimiter_ReturnsSum() {
           XCTAssertEqual(calculator.add("1\n2,3"), 6)
           XCTAssertEqual(calculator.add("1,2\n3"), 6)
           XCTAssertEqual(calculator.add("1\n2\n3"), 6)
       }
       
       // Custom delimiters
       func testCustomDelimiter_ReturnsSum() {
           XCTAssertEqual(calculator.add("//;\n1;2"), 3)
           XCTAssertEqual(calculator.add("//*\n1*2*3*4"), 10)
       }
       
       //Negative numbers throw exception
       func testNegativeNumbers_ThrowsException() {
           XCTAssertThrowsError(try calculator.add("-1,2")) { error in
               XCTAssertEqual(error.localizedDescription, "negative numbers not allowed -1")
           }
       }
       
       func testMultipleNegativeNumbers_ShowsAllInException() {
           XCTAssertThrowsError(try calculator.add("-1,2,-3")) { error in
               XCTAssertEqual(error.localizedDescription, "negative numbers not allowed -1,-3")
           }
       }
       
       // Edge cases
       func testWhitespaceHandling() {
           XCTAssertEqual(calculator.add(" 1 , 2 "), 3)
           XCTAssertEqual(calculator.add("1, 2, 3"), 6)
       }
       
       func testLargeNumbers() {
           XCTAssertEqual(calculator.add("1000,2000,3000"), 6000)
       }
   }
