import UIKit

func solution(_ s:String) -> Bool {
    
    let len = s.count
    
    let indexString : [String] = s.map { (char) -> String in
        String(char)
    }
    
    //print(indexString)
    
    if(len == 4 || len == 6){
        
        for index in 0..<len{
           
            if(indexString[index] >= "0" && indexString[index] <= "9"){
                    
                if(index == len - 1){
                    return true
                }
                
            }else{
                return false
            }
            
        }
        
    }
    
    
    return false
}

print(solution("1234"))
