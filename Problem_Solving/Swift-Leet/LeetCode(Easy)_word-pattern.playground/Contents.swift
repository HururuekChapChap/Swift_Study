import UIKit

class Solution {
    
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
                
        var patterDict : [Character : String] = [:]
        var patterBet : Character = "a"
        var arrayPattern = pattern.map { (char) -> String in
            
            if let exist = patterDict[char] {
                return exist
            }
            else{
                patterDict[char] = String(patterBet)
                patterBet = Character( UnicodeScalar(patterBet.asciiValue! + 1) )
            }
            
            return String(patterDict[char]!)
        }

        
        var arrayStr = str.components(separatedBy: " ")
        var strDict : [String : String] = [:]
        var strBet : Character = "a"
        
        for (index , element) in arrayStr.enumerated() {

            if let exist =  strDict[element] {
                arrayStr[index] = exist
            }
            else{
                strDict[element] = String(strBet)
                arrayStr[index] = String(strBet)
                strBet = Character( UnicodeScalar(strBet.asciiValue! + 1) )
            }
        }
            
        return arrayPattern.joined() == arrayStr.joined() ? true : false
    }
    
}

let pattern = "aaa"
let str = "aa aa aa aa"

print(Solution().wordPattern(pattern, str))
