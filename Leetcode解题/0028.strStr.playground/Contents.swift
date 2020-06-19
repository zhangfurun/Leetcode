import UIKit

func strStr(_ haystack: String, _ needle: String) -> Int {
    if needle.isEmpty {
        return 0
    }
    
    var start_index = -1
    
    let needle_first_char = needle.first
    let needle_count = needle.count
    
    for (index,char) in haystack.enumerated() {
        if (index + needle_count) > haystack.count {
            break;
        }
        if char == needle_first_char {
            let current_start_index = haystack.index(haystack.startIndex, offsetBy: index)
            let hay_cut_index = haystack.index(current_start_index, offsetBy: needle_count)
            let hay_cut_string = haystack[current_start_index..<hay_cut_index]
            
            if hay_cut_string == needle {
                start_index = index
                break;
            }
        }
    }
    return start_index
}

var haystack = "a"
var needle = "a"

print(strStr(haystack, needle))
