import UIKit

class Solution {
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
            
        
        var dictionary : [Character : Int] = [:]
        
        for element in s {
            
            if let exist = dictionary[element] {
                dictionary[element] = exist + 1
            }
            else{
                dictionary[element] = 1
            }
            
        }
        
        for element in t{
            
            if let exist = dictionary[element]{
                
                if exist == 0 {
                    return false
                }
                
                dictionary[element] = exist - 1
            }
            else{
                return false
            }
            
        }
        
        let answer = dictionary.filter { (element) -> Bool in
            if element.value > 0 {
                return true
            }
            return false
        }

        return answer.count == 0 ? true : false
    }
    
}

let s = "rat"
let t = "car"

Solution().isAnagram(s, t)
