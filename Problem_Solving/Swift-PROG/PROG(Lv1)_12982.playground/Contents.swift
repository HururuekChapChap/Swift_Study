import UIKit

func solution(_ d:[Int], _ budget:Int) -> Int {
    
    var count = 0
    
    d.sorted(by: <).reduce(0) { (result, plusElement) -> Int in
        
        if result + plusElement <= budget {
            count += 1
            return result + plusElement
        }
        
        return result
    }
    
    return count
}

let d : [Int] = [1,3,2,5,4]
let budget : Int = 9

solution(d, budget)
