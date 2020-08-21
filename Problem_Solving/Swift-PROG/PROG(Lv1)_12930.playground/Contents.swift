import UIKit

let s = "try hello world"

func solution(_ s:String) -> String {
    
    var temp = ""
    let list = s.components(separatedBy: " ")
    
    for item in list{
        
        for (index, char) in Array(item.lowercased()).enumerated(){
            
            if index % 2 == 0 {
                temp += char.uppercased()
            }
            else{
                temp += String(char)
            }
            
        }
        
        temp += " "
        
    }
    return temp
}

func solution2(_ s:String) -> String{
    
    let string = Array(s.lowercased())
    var answer = ""
    var isFirst : Bool = true
    
    for item in string{
            
        if item == " "{
            answer += " "
            isFirst = true
            continue
        }
            
        if isFirst {
            answer += item.uppercased()
            
        }
        else{
        
        answer += String(item)
            
        }
        isFirst = !isFirst
    }
    
    return answer
}

print(solution2(s))
