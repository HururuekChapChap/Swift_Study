import UIKit

class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        
        var total = 0
        var jump = 1
        
        while total + jump <= n {
            
            total += jump
            
            jump += 1
            
        }
        
        return jump - 1
        
    }
}

print(Solution().arrangeCoins(8))
