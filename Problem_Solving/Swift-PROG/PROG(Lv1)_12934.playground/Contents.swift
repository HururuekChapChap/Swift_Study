import UIKit

func solution(_ n:Int64) -> Int64 {
    
    let num = Int64(sqrt(Double(n)))
    
    if num * num == n {
        return Int64(pow(Double(num + 1), 2))
    }
    
    return -1
}

let n : Int64 = 121

solution(n)
