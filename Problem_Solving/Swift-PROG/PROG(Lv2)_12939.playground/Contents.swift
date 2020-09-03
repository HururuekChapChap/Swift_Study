import UIKit

func solution(_ s:String) -> String {
    
    let list = s.components(separatedBy: " ")
    
    var answerMin : Int?
    var answerMax : Int?
    
    for element in list {
        
        let number = Int(element)!
        
        if answerMin == nil && answerMax == nil {
            answerMin = number
            answerMax = number
            continue
        }
        
        answerMin = min(answerMin! , number)
        answerMax = max(answerMax!, number)
        
    }
    
    return "\(answerMin!) \(answerMax!)"
}


let s = "1 2 3 4"
print(solution(s))
