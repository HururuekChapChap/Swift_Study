import UIKit

public func solution(_ A : inout [Int]) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    var dict : [Int : [Int]] = [:]
    var visited : [Bool] = Array(repeating: true, count: A.max()! + 1)
    
    for (index, element) in A.enumerated(){
        
        if !visited[element]{
            
            var item = 0
            var minValue = Int.max
            var location = 0
            
            for i in 1...A.max()!{
                
                if visited[i] == true {
                        
                    item = abs(index - i)
                    
                    if minValue > item {
                        
                        minValue = item
                        location = i
                        
                    }
                }
                
            }
            
            
            
            
        }
        
        visited[element] = false
        
        
    }
    
    return 0
}

var A = [6,2,3,5,6,3]

solution(&A)
