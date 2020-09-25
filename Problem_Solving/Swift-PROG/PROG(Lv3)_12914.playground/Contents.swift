import UIKit

func solution(_ n:Int) -> Int {
    
    var DP : [Int] = [0,1,2]
    
    if n > 2{
        
        var temp = 3
        
        while temp <= n {
            
            let new = (DP[temp - 1] + DP[temp - 2]) % 1234567
            
            DP.append(new)
            
            temp += 1
        }
        
        
    }
    
    print(DP)
    
    return DP[n]
}

let n = 36

print(solution(n))
