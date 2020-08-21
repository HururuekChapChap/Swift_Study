import UIKit

let n = 99999999

func solution(_ n:Int) -> Int
{
 
    let nToString = String(n)
    var answer = 0
    
    for item in nToString{
       
        if let singleNum = Int(String(item)){
            answer += singleNum
        }
        
    }
    
    return answer
}

print(solution(n))
