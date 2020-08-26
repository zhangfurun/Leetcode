import UIKit

let dic: [String: [String]] = [
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"]
]

var result = [String]()

func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 {
        return []
    }
    let digArray = Array(digits)
    dfs(startString: "", index: 0, digitArray: digArray)
    
    return result
}

func dfs(startString: String, index: Int, digitArray: [Character]) {
    if index == digitArray.count {
        result.append(startString)
        return
    }
    
    let dig = digitArray[index]
    let dicValue = dic["\(dig)"]!
    for next in dicValue {
        dfs(startString: startString + next, index: index + 1, digitArray: digitArray)
    }
}

let digits = "23"
print(letterCombinations(digits))
