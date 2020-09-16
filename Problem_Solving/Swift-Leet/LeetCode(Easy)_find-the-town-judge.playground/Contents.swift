import UIKit

class Solution {
    
    func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
    
        if N == 1 {return 1}
        
        var connect : [Int : [Int]] = [:]
        var howManyTrust : [Bool] = Array(repeating: false, count: N + 1)
        
        for element in trust{
            
            connect[element[1] , default : []].append(element[0])
            
            howManyTrust[element[0]] = true
            
        }
        
        let answer = connect.filter { (element) -> Bool in
            return element.value.count == N - 1
        }
        
        print(connect)
        
        print(howManyTrust)
        
        if !answer.isEmpty && !howManyTrust[ answer.first!.key]{
            
            return answer.first!.key
            
        }
        
        
        
//        if !answer.isEmpty {
//
//        for element in connect{
//
//            for values in element.value{
//
//                if values == answer.first!.key{
//                    return -1
//                }
//
//            }
//
//        }
//
//
//            return answer.first!.key
//
//        }
        
        return -1
    }
    
}

let N = 3
let trust : [[Int]] = [[1,3],[2,3],[3,1]]

print(Solution().findJudge(N, trust))
