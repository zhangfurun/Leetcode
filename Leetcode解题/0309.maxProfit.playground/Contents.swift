import UIKit

let source = [1,2,3,0,2]


// [0]  当天持股
// [1]  当天不持股 处于冷冻期
// [2]  当天不持股 也不处于冷冻期


// i - 1     可做行动            i(最终状态)

// 持股     卖出/继续持有     继续持有  / 买入

// 不可买    等待一天后       卖出

// 可买     买入或者继续可买  继续可买  / 买入
func maxProfit(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: prices.count)
    
    dp[0][0] = -prices[0]
    for (day, price) in prices.enumerated() {
        if day == 0 {
            continue
        }
        // 如果当前持股 那么
        dp[day][0] = max(dp[day - 1][0], dp[day - 1][2] - price)
        dp[day][1] = dp[day - 1][0] + price
        dp[day][2] = max(dp[day - 1][1], dp[day - 1][2])
        
        print("day: \(day + 1)天  dp: \(dp[day])")
    }
    return max(dp[prices.count - 1][1], dp[prices.count - 1][2])
}

print(maxProfit(source))
