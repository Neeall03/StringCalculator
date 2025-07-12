//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Nilaykumar Sevak on 7/11/25.
//

import UIKit
class StringCalculator {
    //delegate for alert
    weak var delegate: StringCalculatorDelegate?
    
    func add(_ numbers: String) -> Int {
        // empty string
        guard !numbers.isEmpty else { return 0 }
        
        //returns delimiter and numbers
        let (delimiter, numbersString) = seprateDelimetersNumbers(numbers)
        
        // this remove  ,(comma) & \n
        let numberStrings = splitNumbers(numbersString, delimiter: delimiter)
        
        // Step 4: Convert to integers and validate
        let integers = try! convertToIntegers(numberStrings)
        
        // on negative numbers it will throw error
        let negativeNumbers = integers.filter { $0 < 0 }
                if !negativeNumbers.isEmpty {
                    let negativeNumbersString = negativeNumbers.map(String.init).joined(separator: ",")
     //show alert of error
     delegate?.showAlert(message: "negative numbers not allowed \(negativeNumbersString)")
                    return 0
                }
        return integers.reduce(0, +)
    }
    //Delimeter function
    private func seprateDelimetersNumbers(_ input: String) -> (delimiter: String, numbers: String) {
        if input.hasPrefix("//") {
            let lines = input.components(separatedBy: "\n")
            let delimiterLine = lines[0]
            let delimiter = String(delimiterLine.dropFirst(2))
            let numbersString = lines.dropFirst().joined(separator: "\n")
            return (delimiter, numbersString)
        } else {
            return (",", input)
        }
    }
    
    private func splitNumbers(_ numbersString: String, delimiter: String) -> [String] {
        let normalizedString = numbersString.replacingOccurrences(of: "\n", with: delimiter)
        return normalizedString.components(separatedBy: delimiter)
    }
    
    private func convertToIntegers(_ numberStrings: [String]) throws -> [Int] {
       //this will make sure nil value or whitespace or "" get removed,it return only INTEGER 
        return numberStrings.compactMap { numberString in
            let trimmed = numberString.trimmingCharacters(in: .whitespaces)
            return trimmed.isEmpty ? 0 : Int(trimmed)
        }
    }
}

// Error state
//only throw error when any negative number hits
 enum CalculatorError: Error {
    case negativeNumbers([Int])
    var localizedDescription: String {
        switch self {
        case .negativeNumbers(let numbers):
            let numbersString = numbers.map(String.init).joined(separator: ",")
            return "negative numbers not allowed \(numbersString)"
        }
    }
}



    
