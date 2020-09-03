import UIKit

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0

    let upA = A.sorted()
    let downB = B.sorted(by: >)
    
    for start in 0..<A.count {
        
        ans += upA[start] * downB[start]
    }
    

    return ans
}

let A = [1,2]
let B = [3,4]

solution(A, B)
