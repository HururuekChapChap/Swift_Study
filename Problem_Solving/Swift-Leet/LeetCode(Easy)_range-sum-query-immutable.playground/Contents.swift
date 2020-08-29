import UIKit

class NumArray {

    let num : [Int]
    
    init(_ nums: [Int]) {
        self.num = nums
    }
    
    func sumRange(_ i: Int, _ j: Int) -> Int {
            
        var total = 0
        for index in i...j {
            total += num[index]
        }
        
        return total
    }
}

let nums = [-2, 0, 3, -5, 2, -1]

let obj = NumArray(nums)
print(obj.sumRange(2, 5))
