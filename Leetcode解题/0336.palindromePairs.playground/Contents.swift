import UIKit

struct WordData {
    var answer = ""
    var wordIndex = -1
    
    init(answer: String = "",
         wordIndex: Int = -1) {
        self.answer = answer
        self.wordIndex = wordIndex
    }
}

//func palindromePairs(_ words: [String]) -> [[Int]] {
//
//    var dic = [String: WordData]()
//
//    for (index, word) in words.enumerated() {
//        var string = ""
//        for char in word.reversed() {
//            string += "\(char)"
//        }
//        let data = WordData.init(answer: string, wordIndex: index)
//
//        dic[word] = data
//    }
//
//    var answer = [[Int]]()
//    for word in words {
//        if let data = dic[word], words.contains(data.answer), let answerIndex = words.firstIndex(of: data.answer), answerIndex != data.wordIndex {
//            answer.append([data.wordIndex, answerIndex])
//        }
//    }
//
//    return answer
//}


func palindromePairs(_ words: [String]) -> [[Int]] {
    var answer = [[Int]]()
    
    // 翻转
    var dic = [String: String]()
    for word in words {
        var string = ""
        for char in word.reversed() {
            string += "\(char)"
        }
        dic[word] = string
    }
    
    
    for (indexWord, word) in words.enumerated() {
        for (indexOther, otherWord) in words.enumerated() {
            if indexWord == indexOther {
                continue
            }
            
            // 相等
            if word.count == otherWord.count {
                let reverOther = dic[otherWord]
                if word == reverOther {
                    answer.append([indexWord, indexOther])
                }
            } else if word.count > otherWord.count {
                let reverOther = dic[otherWord]
                
                let rangeIndex = word.index(word.startIndex, offsetBy: word.count)
                let word_1 = word[word.startIndex...rangeIndex]
                let word_2 = word[rangeIndex...(word.endIndex)]
                if "\(word_1)" == reverOther, isPalind(word: "\(word_2)") {
                    answer.append([indexWord, indexOther])
                }
            } else if word.count < otherWord.count {
                let reverWord = dic[word]
                let rangeIndex = otherWord.index(otherWord.startIndex, offsetBy: otherWord.count)
                let other_1 = otherWord[otherWord.startIndex...rangeIndex]
                let other_2 = otherWord[rangeIndex...(word.endIndex)]
                if "\(other_1)" == reverWord, isPalind(word: "\(other_2)") {
                    answer.append([indexWord, indexOther])
                }
            }
        }
    }
    
    return answer
}

func isPalind(word: String?) -> Bool {
    guard let string = word, !string.isEmpty else {
        return false
    }
    let stringArray = Array(string)
    
    var left = 0
    var right = stringArray.count - 1
    
//    print(word!, stringArray)
    
    while left < right {
        if stringArray[left] != stringArray[right] {
//            print(string, "不符合")
            return false
        }
        
        left += 1
        right -= 1
    }
    
    return true
}

let words = ["abcd","dcba","lls","s","sssll"]

print(NSDate())
print(palindromePairs(words))
print(NSDate())
