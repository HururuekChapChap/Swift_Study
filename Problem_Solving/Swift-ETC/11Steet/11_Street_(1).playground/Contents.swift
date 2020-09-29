import UIKit

public func solution(_ S : inout String) -> Int {
    // write your code in Swift 4.2.1 (Linux)
    
    let temp = Array(S).map { (char) -> String in
        return String(char)
    }
    
    var answer = 0
    
    var index = 0
    var cnt = 0
    
    while index < S.count {
        
        if temp[index] == "a"{
            cnt += 1
            
            if cnt >= 3{
                return -1
            }
            
            if index == S.count - 1{
                
                if cnt < 3 {
                    
                   answer += (2 - cnt)
                    
                }
                
            }
        }
        else{
            
            if cnt >= 3{
                return -1
            }
            
            if cnt < 3 {
                
               answer += (2 - cnt)
                
            }
            
            if index == S.count - 1{
                
                    
                answer += 2
                    
            
                
            }
            
            cnt = 0
        }
        
        index += 1
    }
    
    
    return answer
}

var S = "aba"

print(solution(&S))

