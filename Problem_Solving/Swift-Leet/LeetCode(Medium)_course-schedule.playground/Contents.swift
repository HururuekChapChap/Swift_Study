import UIKit

class Solution {
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        var dict : [Int : [Int]] = [:]
        var connectCnt : [Int] = Array(repeating: 0, count: numCourses)
        for element in prerequisites{
            
            dict[element[1] , default : []].append(element[0])
            connectCnt[element[0]] += 1
            
        }
        
        var queue : [Int] = []
        
        for (index, element) in connectCnt.enumerated(){
            if element == 0 {
                queue.append(index)
            }
        }
        
        print(dict)
        
        print()
        
        print(connectCnt)
        
        while !queue.isEmpty {
            
            let item = queue.removeLast()
            
            if let exist = dict[item] {
                
                for element in exist{
                    
                    connectCnt[element] -= 1
                    
                    if connectCnt[element] == 0 {
                        queue.insert(element, at: 0)
                    }
                    
                }
                
            }
            
        }
        
        return connectCnt.filter { (element) -> Bool in
            return element != 0
        }.count == 0 ? true : false
    }
    
}

let numCourses : Int = 4
let prerequisites : [[Int]] = [[1,0],[2,0],[3,1],[3,2],[2,3]]

print(Solution().canFinish(numCourses, prerequisites))
