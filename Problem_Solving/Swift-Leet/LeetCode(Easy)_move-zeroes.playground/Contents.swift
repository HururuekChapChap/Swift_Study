import UIKit

class Solution {
    
    func moveZeroes(_ nums: inout [Int]) {
    
        var swapIndex = 0
        var moveIndex = nums.count - 1
        
        while moveIndex >= 0 {
            
            if nums[moveIndex] == 0 {
                
                var temp = moveIndex
                
                while temp < nums.count - 1 -  swapIndex {
                    
                    nums.swapAt(temp, temp + 1)
                    
                    temp += 1
                }
                
                swapIndex += 1
                
                
            }
            
                moveIndex -= 1
            
//            print(nums)
            
        }
        
    }
    
    
}

var input = [0,0,0,0,0]

Solution().moveZeroes(&input)
