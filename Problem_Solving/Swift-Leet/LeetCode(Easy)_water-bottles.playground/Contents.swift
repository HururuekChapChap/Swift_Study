import UIKit

class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
            
        var getDrink = numBottles
        var bottoles = numBottles
        
        while bottoles / numExchange != 0 {
            
            getDrink += bottoles / numExchange
            
            bottoles = (bottoles / numExchange) + (bottoles % numExchange)
            
        }
            
        
        return getDrink
    }
}

print(Solution().numWaterBottles(1, 2))

