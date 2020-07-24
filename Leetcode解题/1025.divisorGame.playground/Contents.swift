import UIKit

func divisorGame(_ N: Int) -> Bool {
    return N % 2 == 0
}

let N = 10
print(divisorGame(N) ? "赢了" : "输了")
