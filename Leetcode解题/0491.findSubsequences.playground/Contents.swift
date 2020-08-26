import UIKit

var temp = [Int]()
var ans = [[Int]]()

func findSubsequences(_ nums: [Int]) -> [[Int]] {
    
    dfs(current_index: 0, last_num: Int.min, nums: nums)
    return ans
}

func dfs(current_index:Int, last_num:Int, nums:[Int]) {
    
    if (current_index == nums.count) {
        if (temp.count >= 2){
            ans.append(temp)
        }
        return;
    }
    
    let current_num = nums[current_index]
//    print("======== ", last_num, current_num)
    if last_num <= current_num {
        temp.append(nums[current_index]);
        print(">=: ", current_index, temp)
        dfs(current_index: current_index+1, last_num: nums[current_index], nums: nums)
        temp.removeLast()
        
//        print("remove", temp)
    }
    if last_num != current_num {
        print("!=: ",current_index, temp)
        dfs(current_index: current_index+1, last_num: last_num, nums: nums)
    }
}

var nums = [4, 6, 7]

print(findSubsequences(nums))
