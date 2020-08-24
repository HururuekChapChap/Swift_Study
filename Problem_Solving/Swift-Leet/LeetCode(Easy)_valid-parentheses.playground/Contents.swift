import UIKit

class Solution {
    func isValid(_ s: String) -> Bool {
        
        let list = Array(s)
        
        var stack : [Character] = []
        
        for element in list {
            
            if stack.isEmpty {
                stack.append(element)
                continue
            }
            
            let top = stack.last
            
            switch element {
            case ")":
                
                if top != "("{
                    return false
                }
                
                stack.removeLast()
                
            case "}":
                
                if top != "{" {
                    return false
                }
                
                stack.removeLast()
                
            case "]":
                
                if top != "["{
                    return false
                }
                
                stack.removeLast()
                
            default:
                stack.append(element)
            }
            
        }
        
        
        return stack.isEmpty ? true : false
    }
}

let s = "(([)))"
Solution().isValid(s)
