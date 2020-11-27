import UIKit

func solution(_ n:Int) -> Int {
    
    //원초적인 방법
    
    var number = n
    var three : [String] = []
    
    while number > 0 {
        
        let left = number % 3
        
        number /= 3
        
        three.append("\(left)")
        
    }
    
    var pow : Int = 1
    var answer = 0
    
    for element in three.reversed() {
        
        let number = (pow) * Int(element)!
        
        pow *= 3
        
        answer += number
        
    }
    
    
    return answer
}

let n : Int = 125

print(solution(n))
