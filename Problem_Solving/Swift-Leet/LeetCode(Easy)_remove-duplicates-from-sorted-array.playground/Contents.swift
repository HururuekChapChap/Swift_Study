import UIKit

class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        
        var total = 0
        
        var start = 0
        var end = 0
        
        while start < nums.count || end < nums.count {
            
            while end < nums.count && nums[start] == nums[end]{
                end += 1
            }
            
            total += 1
            
            start = total
                
            while start < end {
            
                nums.remove(at: total)
                start += 1
                
            }
                
            start = total
            end = total
            
        }
        
        print(nums)
            
        return nums.count
    }
    
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        var i = 0
        for j in 0..<nums.count {
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return nums.isEmpty ? 0 : i+1
    }
}

var nums = [1,1,1,3,4,5,5,6,7,7,7]
print(Solution().removeDuplicates2(&nums))

print(nums)
