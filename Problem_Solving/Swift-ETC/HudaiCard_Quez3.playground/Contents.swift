import UIKit

func solution(_ registered_list : [String],_ newid : String) -> String{
    
    var new_id = newid

    
    while registered_list.contains(new_id){
        
        let S = new_id.filter { (char) -> Bool in
               return char.isLetter
           }
        let N = new_id.filter { (char) -> Bool in
               return char.isNumber
           }
           
        var n = 0
        
        if N.isEmpty {
            n = 1
        }
        else{
            n = Int(N)! + 1
        }
        
        new_id = S + String(n)
    }
  
    
    return new_id
}

let registed_list : [String] = ["apple1", "orange", "banana3"]
let newId : String = "apple"

print(solution(registed_list, newId))

