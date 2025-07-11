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
        //debug for String
        print("Numbaer add -->",numbers)
        //this will replace \n (new line) with , (comma)
        let cleanedNumbers = numbers.replacingOccurrences(of: "\n", with: ",")
        //this will remove ,
        let components = cleanedNumbers.split(separator: ",").map(String.init)
        //this sum of given numbers
        let sum = components.compactMap { Int($0) }.reduce(0, +)
                return sum
    }
}

