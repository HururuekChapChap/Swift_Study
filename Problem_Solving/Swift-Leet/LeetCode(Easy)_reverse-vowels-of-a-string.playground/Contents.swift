import UIKit

class Solution {
    
    func reverseVowels(_ s: String) -> String {
        
        var tempString = Array(s)
        
        var start = 0
        var end = tempString.count - 1
        
        while start < end {
            
            while start < end && isVowels(tempString[start]) != true {
                start += 1
            }
            print("start : \(start)")
            while start < end && isVowels(tempString[end]) != true {
                end -= 1
            }
            print("end : \(end)")
            
            let temp = tempString[start]
            tempString[start] = tempString[end]
            tempString[end] = temp
                
            start += 1
            end -= 1
        }
        
        
        return String(tempString)
    }
    
    func isVowels(_ word : Character) -> Bool {
        
        if word == "a" || word == "e" || word == "i" || word == "o" || word == "u" {
            return true
        }
        else if word == "A" || word == "E" || word == "I" || word == "O" || word == "U"{
            return true
        }
        
        return false
    }
    
}

let s = "aA"
print(Solution().reverseVowels(s))
