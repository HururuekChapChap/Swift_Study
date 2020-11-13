import UIKit

class Solution {
    
    func threeConsecutiveOdds(_ arr: [Int]) -> Bool {
        
        var cnt = 0
        
        for (_ , item) in arr.enumerated(){
            
            if item % 2 == 0 {
                cnt = 0
            }
            else{
                cnt += 1
            }
            
            if cnt == 3 {
                return true
            }
        }
        
        return false
    }
    
}

let input  : [Int] = [2,61,41,1]

Solution().threeConsecutiveOdds(input)
