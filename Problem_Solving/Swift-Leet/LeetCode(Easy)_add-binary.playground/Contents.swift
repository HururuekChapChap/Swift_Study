import UIKit

class Solution {
    
    func addBinary(_ a: String, _ b: String) -> String {
        
        let reversed_A = a.reversed().map { (char) -> String in
            return String(char)
        }
        
        let reversed_B = String(b.reversed()).map { (char) -> String in
            return String(char)
        }
        
        let minLen = min(reversed_A.count, reversed_B.count)
        var bothIndex = 0
        var plus = 0
        var answer : [String] = []
        
        while bothIndex < minLen{
            
            let item_A = Int(reversed_A[bothIndex])!
            let item_B = Int(reversed_B[bothIndex])!
            
            let number = item_A + item_B + plus
            
            if number == 2 {
                answer.append("0")
                plus = 1
            }
            else if number == 3{
                answer.append("1")
                plus = 1
            }
            else{
                answer.append("\(number)")
                plus = 0
            }
            
            bothIndex += 1
                
        }
        
        print(answer)
        
        if reversed_A.count == reversed_B.count {
            
            if plus == 1 {
                answer.append("1")
            }
            
        }
        else{
            
            var temp : [String] = []
            
            if reversed_A.count > reversed_B.count {
                temp = reversed_A
            }
            else{
                temp = reversed_B
            }
            
            for start in bothIndex..<temp.count{
                
                var number = Int(temp[start])! + plus
                
                if number == 2 {
                    plus = 1
                    number = 0
                }
                else{
                    plus = 0
                }
                
                answer.append("\(number)")
                
                if start == temp.count - 1{
                    
                    if plus == 1{
                        answer.append("1")
                    }
                    
                }
                
            }
            
            
        }
        
        
        return String(answer.joined().reversed())
    }
    
}


let a = "1011"
let b = "1"

print(Solution().addBinary(a, b))
