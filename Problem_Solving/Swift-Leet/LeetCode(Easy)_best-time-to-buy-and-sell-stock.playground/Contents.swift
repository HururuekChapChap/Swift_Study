import UIKit

let list : [Int] = [7,1,5,3,6,4]

func maxProfit(_ prices: [Int]) -> Int {
        
    var buy = 987654321
    var maxProfit = 0
    
    for index in 0..<prices.count{
        let price = prices[index]
        
        if  price >= buy {
            let sell = price - buy
            
            if sell > maxProfit {
                maxProfit = sell
            }
        }
        else if price < buy {
            buy = price
        }
        
    }
    
    return maxProfit
}

print(maxProfit(list))
