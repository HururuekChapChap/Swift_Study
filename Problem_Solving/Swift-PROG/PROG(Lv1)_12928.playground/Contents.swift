import UIKit

let n : Int = 0

func solution(_ n:Int) -> Int {
    
    var total = 0
    
    if n == 0 {
        return 0
    }
    
    for item in 1...n{
        
        if n % item == 0 {
            total += item
        }
        
    }
    
    return total
}

print(solution(n))
