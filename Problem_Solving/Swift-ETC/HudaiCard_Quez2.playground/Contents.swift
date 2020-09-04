import UIKit

var str = "Hello, playground"


func solution(_ ip_addrs : [String] ,_ langs : [String],_ scores :[Int]) -> Int {
    
    var dict : [String : [Int]] = [:]
    
    var student_cnt : Int = ip_addrs.count
    
    for start in 0..<ip_addrs.count {
        
        let ip = ip_addrs[start]
        
        if let _ = dict[ip] {
            dict[ip]! += [start]
        }
        else{
            dict[ip] = [start]
        }
        
    }
    
    for element in dict {
        
        let getValues = element.value
        print(getValues)
        
        
        if getValues.count >= 4 {
            student_cnt -= getValues.count
        }
        else if getValues.count == 3 {
            
            let getLang = getValues.map { (index) -> String in
                
                if langs[index] == "C" || langs[index] == "C++" || langs[index] == "C#"{
                    return "C"
                }
                
                return langs[index]
            }
            
            if Set(getLang).count == 1 {
                student_cnt -= 3
            }
            
        }
        else if getValues.count == 2{
            
            let getLang = getValues.map { (index) -> String in
                           
                           if langs[index] == "C" || langs[index] == "C++" || langs[index] == "C#"{
                               return "C"
                           }
                           
                           return langs[index]
                       }
            
            let getScore = getValues.map { (index) -> Int in
                return scores[index]
            }
            
            if Set(getLang).count == 1 && Set(getScore).count == 1 {
                student_cnt -= 2
            }
            
        }
        
    }
    
    return student_cnt
}

let ip_addrs : [String] = ["7.124.10.0", "7.124.10.0", "0.0.0.0", "7.124.10.0", "0.0.0.0", "7.124.10.0"]

let langs : [String] = ["C++", "Java", "C#", "C#", "C", "Python3"]

let scores : [Int] = [314, 225, 45, 0, 155, 400]


print(solution(ip_addrs, langs, scores))
