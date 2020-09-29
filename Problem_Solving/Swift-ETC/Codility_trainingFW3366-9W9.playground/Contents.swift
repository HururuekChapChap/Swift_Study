import UIKit

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    
    var new = Array(repeating: 0, count: A.count)
    var answer = Array(repeating: 0, count: A.count)
    
    for index in 0..<A.count{
        
        new[index] = (index + K) % A.count
        
    }
    
    for index in 0..<A.count{
        
        answer[ new[index]  ] = A[index]
        
    }
    
    return answer
}

var A = [0,0,0]
let K = 1

print(solution(&A, K))
