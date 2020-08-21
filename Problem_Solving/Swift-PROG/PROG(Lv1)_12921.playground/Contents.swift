import UIKit

func solution(_ n:Int) -> Int {
    
    var answer = 0
    
    for i in 2...n{
        
        var j = 2
        var flag = true
        while j*j <= i{
            
            if i % j == 0 {
                flag = false
                break;
            }
            
            j += 1
            
        }
        
        if flag {
            answer += 1
        }
        
    }
    
    return answer
}

let n = 100
solution(n)

