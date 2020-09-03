import UIKit

func solution(_ s:String) -> Bool
{
    
    var stack : [Character] = []
    var cnt = 0
    
    for element in s {
    
        if element == "("{
            stack.append(element)
            cnt += 1
        }
        else{
            
            if !stack.isEmpty {
               
                if stack[0] == "("{
                    stack.removeLast()
                }
                
            }
            cnt -= 1
        }
        
    }
    
    if cnt == 0 && stack.isEmpty {
        return true
    }
    
    return false
}



let s = "(()("
print(solution(s))

