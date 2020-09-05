import UIKit

class Solution {
    
 func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var index = 0
        for num in nums {
            if num == val {
                nums.remove(at: index)
            } else {
                index += 1
            }
        }
        return nums.count
    }
    
}

var nums = [0,1,2,2,3,0,4,2]
let val = 2

print(Solution().removeElement(&nums, val))
print(nums)
