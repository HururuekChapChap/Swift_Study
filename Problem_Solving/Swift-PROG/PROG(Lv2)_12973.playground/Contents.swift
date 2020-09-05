import UIKit

func solution(_ s:String) -> Int{
    var answer:Int = 0

    var stack : [Character] = []
    
    for char in s {
        
        if stack.isEmpty {
            stack.append(char)
        }
        else{
            
            let topItem = stack.last!
            
            if topItem == char {
                stack.removeLast()
            }
            else{
                stack.append(char)
            }
            
        }
        
    }
    
    return stack.isEmpty ? 1 : 0
}

let s = "baabaa"

print(solution(s))
