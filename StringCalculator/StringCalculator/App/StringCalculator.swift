//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Nilaykumar Sevak on 7/11/25.
//

import UIKit

class StringCalculator{
    //to check error added 
    func add(_ numbers:String) throws -> Int {
       //check empty string
       guard !numbers.isEmpty else {
            return 0
        }
        //taken as object for delimiter
        var delimiters: CharacterSet = [",", "\n"]
        var numbersToParse = numbers

        if numbers.hasPrefix("//") {
            if let firstNewlineIndex = numbers.firstIndex(of: "\n") {
                let delimiterString = String(numbers[numbers.index(numbers.startIndex, offsetBy: 2)..<firstNewlineIndex])
                if let customDelimiterCharaecter = delimiterString.first {
                    delimiters.insert(customDelimiterCharaecter)
                }
                numbersToParse = String(numbers[numbers.index(after: firstNewlineIndex)...])
            }
        }
        
        //debug for String
        print("Numbaer add -->",numbers)
        //here we need to pass Array in sepratedBy, for that we need to add delimeter in an array.
        let components = numbersToParse.components(separatedBy: delimiters)
       
        //this sum of given numbers
        let sum = components.compactMap { Int($0) }.reduce(0, +)
                return sum
    }
}
//Equatable for easier comparison
enum CalculatorError: Error, Equatable {
    case negativeNumbersNotAllowed(String)
}
