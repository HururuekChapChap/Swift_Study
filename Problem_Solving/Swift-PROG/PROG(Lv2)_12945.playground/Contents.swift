import UIKit

var DP : [Int] = Array(repeating: 0, count: 100001)

func solution(_ n:Int) -> Int {
    
    
    if n < 2 {
        return n
    }
    
    if DP[n] != 0 {
        return DP[n]
    }
    
    DP[n] = (solution(n - 1) + solution(n - 2)) % 1234567
    
    return DP[n]
}

let n = 100

print(solution(n))

        
