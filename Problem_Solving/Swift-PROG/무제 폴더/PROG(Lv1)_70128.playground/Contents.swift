import UIKit

func solution(_ a:[Int], _ b:[Int]) -> Int {
    
    var total = 0
    
    for (index , item) in a.enumerated(){
        
        total += item * b[index]
        
    }
    
    return total
}

let a : [Int] = [-1,0,1]
let b : [Int] = [1,0,-1]

solution(a, b)
