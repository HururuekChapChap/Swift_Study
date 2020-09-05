import UIKit

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int
{
    var answer = 0
    
    var tempA = a
    var tempB = b
    
    while tempA != tempB {
        
        if tempA % 2 != 0 {
            tempA = tempA / 2 + 1
        }
        else{
            tempA = tempA / 2
        }
        
        
        if tempB % 2 != 0 {
            tempB = tempB / 2 + 1
        }
        else{
            tempB = tempB / 2
        }
        
        answer += 1
        
    }
    

    return answer
}


let n = 8
let a = 4
let b = 7

print(solution(n, a, b))
