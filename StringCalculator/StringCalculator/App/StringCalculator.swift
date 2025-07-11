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
        
        return Int(numbers) ?? 0
    }
}

