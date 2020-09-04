import UIKit

func solution(_ s:String) -> String {
    
    var temp = Array(s.lowercased())
    
    var flag = true
    
    for (index, element) in temp.enumerated() {
        
        if flag == true {
            
            if element.isLetter {
                temp[index] = Character( element.uppercased() )
            }
            
            flag = false
        }
        
        if element == " " {
            flag = true
        }
        
    }
    
    return temp.map { (char) -> String in
        return String(char)
    }.joined()
}

let s = "for the last week"

print(solution(s))
