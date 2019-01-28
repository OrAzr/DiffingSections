//
//  String+Utils.swift
//  DiffingWithDiffer
//
//  Created by Or on 1/24/19.
//  Copyright © 2019 BankHapoalim. All rights reserved.
//

import Foundation


extension String {
    static func random(length:Int) -> String{
        let letters:NSString = "abcdefghijklmpopqrstuyz1234567809!@#$%^&*()"
        let len = UInt32(letters.length)
        
        var randomString = ""
        
        for _ in 0..<length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            randomString += NSString(characters: &nextChar, length: 1)as String
        }
        
        print(randomString)
        return randomString
    }
}
