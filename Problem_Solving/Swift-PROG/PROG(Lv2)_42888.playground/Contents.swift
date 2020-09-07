import UIKit

//0:23
func solution(_ record:[String]) -> [String] {
    
    var dict : [String : String] = [:]
    var stack : [(id : String , commend : String)] = []
    
    for element in record {
        
        let list = element.components(separatedBy: " ")
//        print(list)
        let commend = list[0]
        let userid = list[1]
        
        if commend == "Enter" || commend == "Leave"{
            stack.append((userid, commend))
            
            if commend == "Enter"{
            let name = list[2]
            
            if let _ = dict[userid] {
                dict[userid] = name
            }
            else{
                dict[userid] = name
            }
            }
            
        }
        else if commend == "Change" {
            let name = list[2]
            dict[userid] = name
        }
        
    }
    
    var answer : [String] = []
    
    for element in stack {
        
        let name = dict[element.id]!
        let commend = element.commend
        
        if commend == "Enter"{
//            let input = "\(name)님이 들어왔습니다."
            answer.append("\(name)님이 들어왔습니다.")
        }
        else if commend == "Leave"{
            answer.append("\(name)님이 나갔습니다.")
        }
        
    }
    
    
    return answer
}


let recode = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

print(solution(recode))
