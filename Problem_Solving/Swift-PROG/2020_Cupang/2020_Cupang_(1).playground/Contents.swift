import UIKit

func solution(_ N : Int) -> [Int] {
    
    var maxValue : Int = 0
    var maxLoc : Int = 0
    
    for i in 2..<10{
        
        let code = String(N , radix: i)
        
        let numbers = code.filter { (char) -> Bool in
            return char != "0"
        }
        
        print(numbers)
        
        let result = numbers.reduce(1) { (result, char) -> Int in
            
            return result * Int(String(char))!
            
        }
        
        print(numbers , result)
        
        if maxValue <= result {
            maxValue = result
            maxLoc = i
        }
        
        
    }
    
    
//    print(maxValue , maxLoc)
    return [maxLoc , maxValue]
}

let N : Int = 1000000

print(solution(N))
