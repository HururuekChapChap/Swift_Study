import UIKit

class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        
        for (index, element) in numbers.enumerated() {
         
            let itemIndex = binarySearch(numbers, target - element, index + 1)
            
            if element + numbers[itemIndex] == target{
                return [index + 1, itemIndex + 1]
            }
            
        }
        
        return []
    }
    
    func binarySearch(_ numbers : [Int], _ target : Int, _ start : Int) -> Int {
        
        var startPoint = start
        var endPoint = numbers.count - 1
        
        while startPoint <= endPoint {
            
            let mid = ( startPoint + endPoint ) / 2
            
            if numbers[mid] > target {
                endPoint = mid - 1
            }
            else{
                startPoint = mid + 1
            }
            
        }
        
        
        return endPoint
    }
}

let numbers : [Int] = [2,7,11,15]
let target : Int = 18

print(Solution().twoSum(numbers, target))
