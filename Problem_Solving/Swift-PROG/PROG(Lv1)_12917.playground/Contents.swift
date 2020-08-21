import UIKit

func solution(_ s:String) -> String {
    
    let sArray = Array(s)
    
    var lower = sArray.filter { (char) -> Bool in
        
        if char >= "a" && char <= "z" {
            return true
        }
        
        return false
    }
    
    var upper = sArray.filter { (char) -> Bool in
        
        if char >= "A" && char <= "Z" {
            return true
        }
        
        return false
    }
    
    lower = lower.sorted(by: >)
    upper = upper.sorted(by: >)
    
    //print(String(lower + upper))
    
    return String(lower + upper)
}

//대문자가 아스키 코드 값이 더 작다. 그래서 소문자가 자동으로 앞으로 간다.
func solution2(_ s:String) -> String{
    
    print(String(s.sorted(by: >)))
    
    return ""
}

let s = "Zbcdefg"
print(solution2(s))
