import UIKit

func solution(_ numbers:[Int]) -> [Int] {
    
    var list : [Int] = []
    
    for first in 0..<numbers.count {
        
        for second in first + 1..<numbers.count{
            
            let num = numbers[first] + numbers[second]
            
            if !list.contains(num){
                list.append(num)
            }
            
        }
    }
    
    return list.sorted()
}


let numbers : [Int] = [5,0,2,7]

solution(numbers)
