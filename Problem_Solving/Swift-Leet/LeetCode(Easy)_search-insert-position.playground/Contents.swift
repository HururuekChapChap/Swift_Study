import UIKit

class Solution {
    
    
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            
        var start = 0
        var end = nums.count
        
        while start < end {
            
           let min = (start + end) / 2
            
            print(min, start, end)
    
            if nums[min] < target{
                start = min + 1
            }
            else{
                end = min
            }
            
        }
        
        return end
    }
    
    
}

let nums : [Int] = [1,3,5,6]
Solution().searchInsert(nums, 0)
