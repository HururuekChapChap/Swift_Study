import UIKit

let input = "{{4,2,3},{3},{2,3,4,1},{2,3}}"

func solution(_ s:String) -> [Int] {
    
    var dic : [Int : Int] = [:]
    var list : [[Int]] = []
    var answer : [Int] = []
    
    let input = s.map { (char) -> String in
        String(char)
    }
    
    var flag : Bool = false
    var cnt = -1
    var stringNum : String = ""
    for item in 1..<input.count-1{
    
        if input[item] == "{"{
            cnt += 1
            flag = true
            list.append([])
            
        }
        else if input[item] == "}"{
         
            flag = false
        }
        else if  input[item] != ","{
            
            if flag == true {
                stringNum += input[item]
            }
            
        }
        else if input[item] == "," {
            list[cnt].append(Int(stringNum)!)
            stringNum = ""
        }
        
    }
    
   list[cnt].append(Int(stringNum)!)
    
    list = list.sorted(by: { (element1, element2) -> Bool in
        return element1.count < element2.count
    })
    
     
    
    for index in 0..<list.count{
        
        for element in list[index]{
            
            if dic[element] == nil {
                dic[element] = 1
                answer.append(element)
            }
            
        }
        
    }
    

    
    //print(answer)
    
    return answer
}

solution(input)
