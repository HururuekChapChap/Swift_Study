import UIKit

class Solution {
    
    func buildArray(_ target: [Int], _ n: Int) -> [String] {
        
        var answer : [String] = []

        for index in 1...n{
            
            if index > target.last! {
                continue
            }
            
            if target.contains(index) {
                push(&answer)
            }
            else{
                push(&answer)
                pop(&answer)
            }
            
        }
        
        return answer
    }
    
    private func push(_ answer : inout [String]){
        
        answer.append("Push")
        
    }
    
    private func pop(_ answer : inout [String]){
    
        answer.append("Pop")
    }
}


let list : [Int] = [2,3,4]
let n : Int = 4

Solution().buildArray(list, n)

