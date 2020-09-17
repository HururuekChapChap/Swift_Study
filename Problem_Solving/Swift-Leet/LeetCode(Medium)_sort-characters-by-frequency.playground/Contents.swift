import UIKit

class Solution {
    func frequencySort(_ s: String) -> String {
        
        var dict : [Character: Int] = [:]
        
        for element in s {
            
            if let exist = dict[element]{
                dict[element] = exist + 1
            }
            else{
                dict[element] = 1
            }
            
        }
        
        let sortedList = Array(dict).sorted { (element1, element2) -> Bool in
            return element1.value > element2.value
        }
        
        
        var answer : String = ""
        
        for element in sortedList{
            
            answer += String(repeating: element.key, count: element.value)
            
        }
        
        return answer
    }
}

let s = "A"

print(Solution().frequencySort(s))
