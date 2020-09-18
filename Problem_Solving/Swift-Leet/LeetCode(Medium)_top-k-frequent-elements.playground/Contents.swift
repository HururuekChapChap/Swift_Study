import UIKit

class Solution {
    
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
    
        var dictionary : [Int : Int] = [:]
        
        for element in nums{
            
            if let exist = dictionary[element]{
                dictionary[element] = exist + 1
            }
            else{
                dictionary[element] = 1
            }
            
        }
        
       let tempDict =  dictionary.sorted { (element1, element2) -> Bool in
            return element1.value > element2.value
        }
        
        var answer : [Int] = []
        
        for i in 0..<k{
            answer.append(tempDict[i].key)
        }
        
        
        return answer
    }
    
}

let nums = [1,1,1,2,2,3]
let k = 2

print(Solution().topKFrequent(nums, k))
