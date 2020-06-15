import UIKit

var str = "Hello, playground"

var romainData: [String: Int] = ["I": 1,
                                    "V": 5,
                                    "X": 10,
                                    "L": 50,
                                    "C": 100,
                                    "D": 500,
                                    "M": 1000];

func romanToInt(_ s: String) -> Int {
    var number = 0

    let romanArray: [String] = s.map{ String($0) }

    var index = 0

    while index < romanArray.count {
        let currentChar = romanArray[index]

        var addNumber = 0
        if index < romanArray.count - 1 {
            let nextChar = romanArray[index + 1]
            if currentChar == "I" {
                if nextChar == "V" {
                    addNumber = 4
                } else if nextChar == "X" {
                    addNumber = 9
                }
            } else if currentChar == "X" {
                let nextChar = romanArray[index + 1]
                if nextChar == "L" {
                    addNumber = 40
                } else if nextChar == "C" {
                    addNumber = 90
                }
            } else if currentChar == "C" {
                let nextChar = romanArray[index + 1]
                if nextChar == "D" {
                    addNumber = 400
                } else if nextChar == "M" {
                    addNumber = 900
                }
            }
        }

        if addNumber > 0 {
            number += addNumber
            index += 2
            continue
        } else {
            if let value = romainData[currentChar] {
                number += value
            }
            index += 1
        }
    }

    return number
}

//var romainData: [Character: Int] = ["I": 1,
//                                    "V": 5,
//                                    "X": 10,
//                                    "L": 50,
//                                    "C": 100,
//                                    "D": 500,
//                                    "M": 1000];
//
//func romanToInt(_ s: String) -> Int {
//   var number = 0
//    var recordPreValue = 0
//    for char in s {
//        if let charValue = romainData[char] {
//            number += charValue
//            if recordPreValue < charValue {
//                number -= 2 * recordPreValue
//            }
//            recordPreValue = charValue
//        }
//    }
//
//    return number
//}


let roman = "XXVII"
let number = romanToInt(roman)
print(number)
