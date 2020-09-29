import UIKit

class Solution {
    
    func addBinary(_ a: String, _ b: String) -> String {
        
        var cnt = 0
        var a_sum : Int64 = 0
        for element in a.reversed() {
            
            if element == "1" {
                a_sum += Int64(pow(2, Double(cnt)))
            }
            
            cnt += 1
        }
        
        print(a_sum)
        
        cnt = 0
        var b_sum : Int64 = 0
        for element in b.reversed() {
            
            if element == "1" {
                b_sum += Int64(pow(2, Double(cnt)))
            }
            
            cnt += 1
        }
        
        print(b_sum)
        
        return String(a_sum + b_sum , radix : 2)
    }
    
}


let a = "1010"
let b = "1011"

print(Solution().addBinary(a, b))
