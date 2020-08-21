import UIKit

func maxSubArray(_ nums: [Int]) -> Int {

    var maxSingle = nums[0]
    var currentNum = 0
    var maxNum : Int? = nil
    
    for item in nums{
    
        currentNum += item
        
        if maxSingle < item {
            maxSingle = item
        }
        
        if currentNum < 0 {
            currentNum = 0
            continue
        }
        
        
        if maxNum == nil {
            maxNum = currentNum
        }
        else{
            maxNum = max(maxNum! , currentNum)
        }
        
    }
    
    return maxNum ?? maxSingle
}

let nums = [-2,1,-3,4,-1,2,1,-5,4]
print(maxSubArray(nums))
