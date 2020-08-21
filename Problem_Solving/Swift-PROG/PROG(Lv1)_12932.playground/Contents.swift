import UIKit

let n : Int64 = 123142

func solution(_ n:Int64) -> [Int] {
    
    let list = Array(String(n))
    
    let answer = list.reversed()

    return answer.map { (char) -> Int in
        
       return Int(String(char))!
        
    }
}

print(solution(n))
