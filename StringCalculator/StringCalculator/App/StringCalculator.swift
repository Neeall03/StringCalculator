//
//  StringCalculator.swift
//  StringCalculator
//
//  Created by Nilaykumar Sevak on 7/11/25.
//

import UIKit

class StringCalculator{
    func add(_ numbers:String)->Int{
       //check empty string
       guard !numbers.isEmpty else {
            return 0
        }
        //taken as object for delimiter
        var delimiter: Character = ","
        //this will replace
        var numbersToParse = numbers
        // ; single char delimiter
        if numbers.hasPrefix("//") {
            if let firstNewlineIndex = numbers.firstIndex(of: "\n") {
                let delimiterString = String(numbers[numbers.index(numbers.startIndex, offsetBy: 2)..<firstNewlineIndex])
                if let customDel = delimiterString.first {
                    delimiter = customDel
                }
                numbersToParse = String(numbers[numbers.index(after: firstNewlineIndex)...])
            }
        }
        
        //debug for String
        print("Numbaer add -->",numbers)
        //this will replace \n (new line) with , (comma)
        let cleanedNumbers = numbersToParse.replacingOccurrences(of: "\n", with: String(delimiter))
        //this will remove ,
        let components = cleanedNumbers.split(separator: delimiter).map(String.init)
        //this sum of given numbers
        let sum = components.compactMap { Int($0) }.reduce(0, +)
                return sum
    }
}

