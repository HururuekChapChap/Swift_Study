import UIKit

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var newInfo : [[String]] = []
    var newQuery : [[String]] = []
    for element in info{
        
        let item = element.components(separatedBy: " ")
        
        newInfo.append(item)
    }
    
    for element in query{
    
        let item = element.components(separatedBy: " ").filter { (char) -> Bool in
            return char != "and" && char != "-" ? true : false
        }
        
        
        newQuery.append(item)
    }
    
    print(newInfo)
    
    print()
    
    print(newQuery)
    
    var answer : [Int] = []
    for element in newQuery{
        var person = 0
        for info in newInfo{
            
            var cnt = 0
            for single in element{
                
                if let number = Int(single){
                    
                    if number <= Int(info[info.count - 1])!{
                        cnt += 1
                    }
                    
                }
                else{
                    
                    if info.contains(single){
                       cnt += 1
                    }
                    
                }
                
            }
            
            if cnt == element.count {
                person += 1
            }
            
        }
        
        answer.append(person)
        
    }
    
    print(answer)
    
    return []
}

let info = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]

let query = ["java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]

solution(info, query)
