import UIKit

class Solution {
    
    func rob(_ nums: [Int]) -> Int {
            
        var sumList : [Int] = Array(repeating: 0, count: nums.count)
        
        for (index,element) in nums.enumerated(){
            
            if index == 0 || index == 1 {
                sumList[index] = element
            }
            else if index == 2 {
                sumList[index] = element + sumList[0]
            }
            else{
                let beforeOne = element + sumList[index - 2]
                let beforeTwo = element + sumList[index - 3]
                
                let maxSum = max(beforeOne, beforeTwo)
                
                sumList[index] = maxSum
            }
            
        }
        
        
        return sumList.max() ?? 0
        
    }
    
}

let nums : [Int] = []
Solution().rob(nums)
