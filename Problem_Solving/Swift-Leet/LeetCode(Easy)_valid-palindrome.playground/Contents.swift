import UIKit

class Solution {
    
    func returnStringByRex(pattern : String , word : String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
            
            let result = regex.matches(in: word, options: [], range: NSRange(location: 0, length: word.count))
            
            let rexStrings = result.map { (element) -> String in
                
                let range = Range(element.range, in: word)!
                
                return String(word[range])
                
            }
            
            return rexStrings
        } catch let error {
            print(error.localizedDescription)
        }
        
        return []
        
    }
    
    func isPalindrome(_ s: String) -> Bool {
                
        let validString = returnStringByRex(pattern: "[a-z0-9]+", word: s.lowercased()).joined().map { (char) -> String in
            return String(char)
        }
        
        print(validString)
        var start = 0
        var end = validString.count - 1
        
        
        while start < end {
            
            if validString[start] != validString[end] {
                return false
            }
            
            start += 1
            end -= 1
        }
        
        return true
    }
    
}

let s = "r0p"

//print(Solution().isPalindrome(s))


let char : Character = "a"

if char.isLetter {
    print(char.isLetter)
}

let newLine : Character = "\n"

if newLine.isNewline {
    print(newLine.isNewline)
}


