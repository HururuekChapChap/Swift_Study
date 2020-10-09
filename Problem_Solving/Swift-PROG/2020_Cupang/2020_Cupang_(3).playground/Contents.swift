import UIKit

func solution(_ depar : String, _ hub : String, _ dest : String, _ roads: [[String]]) -> Int {
    
    var dict : [String : [String]] = [:]
    var checkBox : Set<String> = []
    
    for element in roads{
        
        dict[element[0] , default : []].append(element[1])
        
    }
    
    var queue : [(String, String)] = [(depar, "\(depar)")]
    
    while !queue.isEmpty {
        
        let item = queue.removeLast()
        
//        print(item.0 , item.1)
        
        for element in dict[item.0, default: []] {
            
            let temp = item.1 + "->" + element
            
            if checkBox.contains(temp) {continue}
            
            checkBox.insert(temp)
            
            queue.insert((element , temp), at: 0)
        }
        
    }
    
    var answer = 0
    
    for element in Array(checkBox) {
        
        let splite = element.components(separatedBy: "->")
        
        if splite[0] == depar && splite[splite.count - 1] == dest {
            
            if splite.contains(hub) {
                    answer += 1
            }
            
        }
        
    }
    
    
    
    
    return answer
}


let depar = "SEOUL"
let hub = "DAEGU"
let dest = "YEOSU"
let roads = [["ULSAN","BUSAN"],["DAEJEON","ULSAN"],["DAEJEON","GWANGJU"],["SEOUL","DAEJEON"],["SEOUL","ULSAN"],["DAEJEON","DAEGU"],["GWANGJU","BUSAN"],["DAEGU","GWANGJU"],["DAEGU","BUSAN"],["ULSAN","DAEGU"],["GWANGJU","YEOSU"],["BUSAN","YEOSU"]]

print(solution(depar, hub, dest, roads))

