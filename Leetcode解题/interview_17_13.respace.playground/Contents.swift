import UIKit

//let dictionary = ["looked","just","like","her","brother"]
//
//let sentence = "jesslookedjustliketimherbrother"

let dictionary = ["bt","vbtbvtvvbbvtbvvbbbvbtbbv","bvvbbbvvvbvttbtbvtvtvvbttbbbtvvvb","btttbvbbbtbbtbvvttbvbvtvbtbbttb","bt","vvbvbvbvtbvbvvvvtv","tbvvvtttvtbvbtttvvbtvvvvtvvbvvtvvbbvbbbvb","v","bvb","vvtbvtvbttbttvvbvttbt","btbtbtttvbbtbttbtvvttbvtbtvtbvvtbbbb","bttbvbbttvvbtvvvvb","bvvbvbvttbvtbvvtbttvvvvtvbtvbttbbvvtvtvv","vbtttt","btbvbbbvbtvtbvvv","b","tbtbtv","vbvbbvvbvbbvvb","vbvvtvbvbvbttvbvbtvbtbtvtbvbbtb","bvvbvvttttttbtvvvttvbvtvvbvtbtvtbvttvvtbt","bvtbttv","bbbt","vtt","ttvv","b","vbb","vtvvbtttvtbbvvbbtbb","vvv","vvvvbbbtbbbvbbbb","ttvvbtvv","v","btvbbvtbbvbvtvttvvbbbtbvvvtbtb","vv","btbttbtbbvbvvbvttbttvtbbtbvtttvbbtbbtvtvvvvbbttvtvvbbbv","ttvbbbbttbtbtb","tvvbvbvvb","vv","ttbttvtvbtbbbbv","bvvvtbbvvvbtvbvtvtvvvvbb","vtbvvbvvvvvttvbbttbbvtvt","tbvbbt","b","v","tvbbtvvtvvtbtbttvvvb","tbttbttbbbtbtvtvtvtbbbvvtbbbvbbvvvbbttvvt","bbvttvtvvtbvbbttvbbtbvvttbvbvbtbvvvbbbvbvbvbtvbtvvvtvvtbttbttbbvbbbttvvvbvvtb","vttvvbvv","tbttbvvttvbtvvtbbvvv","bvbbbbbbbb","vtbvvtbbvtt","bvttbvvbvb","tvttttbbvvvbbtttvvv"]

let sentence = "btbvtttttbvttbvvbbtvvbvbvvbtbtbtvbtttbvbbbtbbtbvvttbvbvtvbtbbttbvvbvbtttbvttbvvbbvvv"


//let dictionary = ["frrrbbrrbfrfqqbbbrb", "qr", "b", "rf", "qqbbbbfrqbrrqrffbrqqqbqqfqfrr", "r", "ffqq", "bffbqfqqbrrrf", "fq", "qfr", "fr", "rqrrbfbfq", "r", "f", "qbqbrbrbqfqbbbfbbbfbq", "bqqbbbqrbbrf", "f"]
//let sentence = "bqqffbqbbfqrfrrrbbrrbfrfqqbbbrbfqfffffrfqfqfffffrrfqfrrqbqfrbfrqqrfrbrbbqbqbqqfqrfbfrfr"

//let dictionary = ["potimzz"]
//
//
//let sentence = "potimzzpotimzz"


//let dictionary = ["aaysaayayaasyya","yyas","yayysaaayasasssy","yaasassssssayaassyaayaayaasssasysssaaayysaaasaysyaasaaaaaasayaayayysasaaaa","aya","sya","ysasasy","syaaaa","aaaas","ysa","a","aasyaaassyaayaayaasyayaa","ssaayayyssyaayyysyayaasaaa","aya","aaasaay","aaaa","ayyyayssaasasysaasaaayassasysaaayaassyysyaysaayyasayaaysyyaasasasaayyasasyaaaasysasy","aaasa","ysayssyasyyaaasyaaaayaaaaaaaaassaaa","aasayaaaayssayyaayaaaaayaaays","s"]
//let sentence = "asasayaayaassayyayyyyssyaassasaysaaysaayaaaaysyaaaa"


func respace(_ dictionary: [String], _ sentence: String) -> Int {

    var dp = Array(repeating: 0, count: sentence.count + 1)

    var curtail_dic = [String: Int]()

    var dic_min_count = 0
    for value in dictionary {
        if let _ = curtail_dic[value] {
            continue
        }
        curtail_dic[value] = value.count
        dic_min_count = min(dic_min_count, value.count)
    }
    

    for i in 0...sentence.count {
        if i == 0 {

            dp[0] = 0
            continue
        }

        dp[i] = dp[i - 1] + 1
        
        if i < dic_min_count {
            continue
        }
        let end = i - 1
        
        for (dic_string, dic_string_count) in curtail_dic {
            
            let start = i - dic_string_count
            if start < 0 {
                continue
            }
//            print(i , flag_count, start, end)
            
            let start_index = sentence.index(sentence.startIndex, offsetBy: start)
            let end_index = sentence.index(sentence.startIndex, offsetBy: end)

            let sub_string = sentence[start_index...end_index]
            if dic_string == sub_string {
                 dp[i] = min(dp[i], dp[i - dic_string_count])
            }
        }

//        for value in newDic.keys {
//            if i >= value.count {
//
//                let start = i - value.count
//                let end = i - 1
//
//
//                let start_index = sentence.index(sentence.startIndex, offsetBy: start)
//                let end_index = sentence.index(sentence.startIndex, offsetBy: end)
//
//                let sub_string = sentence[start_index...end_index]
//
//                if value == sub_string {
//                    dp[i] = min(dp[i], dp[i - value.count])
//                }
//            }
//        }
//        print(dp)
    }

    return dp[sentence.count]
//    return count
}

func respace(_ dictionary: [String], _ sentence: String) -> Int {
    let length = sentence.count
    if length == 0 {
        return 0
    }
    let root = Trie()

    var curtail_dic = [String: Int]()

    var dic_min_count = 0
    for value in dictionary {
        if let _ = curtail_dic[value] {
            continue
        }
        
        dic_min_count = min(dic_min_count, value.count)
        curtail_dic[value] = value.count
        root.insert(value)
    }

    var dp = Array<Int>(repeating: 0, count: length + 1)
    dp[0] = 0
    let chars = Array(sentence)
    for i in 1...length {
        dp[i] = dp[i-1] + 1
        if i < dic_min_count {
            continue
        }

        var curPos = root
        
        var j = i
        while j >= 1 {
            let t = Int( chars[j-1].asciiValue! - Character("a").asciiValue!)
            if curPos.next[t] == nil {
                break
            }else if curPos.next[t]!.isEnd {
                dp[i] = min(dp[i],dp[j-1])
            }
            
            if dp[i] == 0 {
                break
            }
            curPos = curPos.next[t]!
            j -= 1
        }
    }
    return dp[length]
}

class Trie {
    var next:[Trie?] = []
    var isEnd = false
    
    init() {
        next = Array<Trie?>(repeating: nil, count: 26)
        isEnd = false
    }
    
    func insert(_ s: String) {
        var curPos = self
        let reversed = String( s.reversed())
        for char in reversed {
            let t = Int(char.asciiValue! - Character("a").asciiValue!)
            if curPos.next[t] == nil {
                curPos.next[t] = Trie()
            }
            curPos = curPos.next[t]!
        }
        curPos.isEnd = true
    }
}



print("未匹配字符:\(respace(dictionary, sentence))")



