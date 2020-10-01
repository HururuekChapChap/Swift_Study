import UIKit

class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        
        var start = 0
        var end = nums.count - 1
        
        while start <= end {
            
            let mid = (start + end) / 2
            
            print(mid , nums[mid])
            
            if nums[mid] == target{
                return mid
            }
            else if nums[mid] < target {
                start = mid + 1
            }
            else {
                end = mid - 1
            }
        
        }
        
        return -1
    }
}

let nums = [-1,0,3,5,9,12]
let target = -1

print(Solution().search(nums, target))
