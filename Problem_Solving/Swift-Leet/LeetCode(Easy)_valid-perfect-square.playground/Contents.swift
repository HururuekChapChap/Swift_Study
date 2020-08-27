import UIKit

class Solution {
    func isPerfectSquare(_ num: Int) -> Bool {
        
        var end = num
        var start = 1
        
        if num == 1 {
            return true
        }
            
        while start < end {
            
            let mid = (start + end) / 2
            
           // print(start,  end, mid)
            
            if mid * mid == num {
                return true
            }
            
            if mid*mid > num {
                end = mid
            }
            else{
                start = mid + 1
            }
            
        }
        
        return false
    }
    
    func isPerfectSquare2(_ num: Int) -> Bool {
         var L = 0
         var R = num
         while (L <= R) {
             let mid = (L + R) / 2
             
             if(mid * mid > num) {
                 R = mid - 1
             }
             else if (mid * mid < num) {
                 L = mid + 1
             }
             else {
                 return true
             }
         }
         return false
     }
    
}

Solution().isPerfectSquare(1)
