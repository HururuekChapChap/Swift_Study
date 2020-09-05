import UIKit

func solution(_ n:Int) -> Int
{
    var ans:Int = 0
    
    
    var temp = n
    
    while temp > 0 {
        
        if temp % 2 != 0 {
            ans += temp % 2
        }
        
        temp = temp / 2
        
    }
    
    return ans
}

print(solution(5))
