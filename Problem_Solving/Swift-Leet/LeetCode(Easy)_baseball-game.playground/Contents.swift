import UIKit


class Solution {
    
    func calPoints(_ ops: [String]) -> Int {
            
        var answer : [Int] = []
        
        for element in ops{
            
            if let number = Int(element){
                answer.append(number)
            }
            else{
                
                if element == "C"{
                    answer.remove(at: answer.count - 1)
                }
                else if element == "D"{
                    let doubleNum = answer.last! * 2
                    answer.append(doubleNum)
                }
                else if element == "+"{
                    let plus = answer[answer.count - 1] + answer[answer.count - 2]
                    answer.append(plus)
                }
             
            }
        }
        
        return answer.reduce(0) { (number1, number2) -> Int in
            return number1 + number2
        }
    }
    
}

let ops = ["5","2","C","D","+"]
Solution().calPoints(ops)
