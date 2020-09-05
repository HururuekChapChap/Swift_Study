import UIKit


// 46 : 57
func solution(_ str1:String, _ str2:String) -> Int {
    
    let new1 = Array(str1.lowercased())
    let new2 = Array(str2.lowercased())
    
    var stack1 : [String : Int] = [:]
    var stack2 : [String : Int] = [:]
    
    var index = 0
    
    while index < new1.count - 1 {
        
        if new1[index].isLetter && new1[index + 1].isLetter {
        
        let word = String(new1[index]) + String(new1[index + 1])
            
        
        if let exist = stack1[word] {
            stack1[word] = exist + 1
        }
        else{
            stack1[word] = 1
        }
            
        }
        
        index += 1
    }
    
    index = 0
    
    while index < new2.count - 1 {
          
        if new2[index].isLetter && new2[index + 1].isLetter {
        
          let word = String(new2[index]) + String(new2[index + 1])
              
          
          if let exist = stack2[word] {
              stack2[word] = exist + 1
          }
          else{
              stack2[word] = 1
          }
            
        }
          
          index += 1
      }
    
    print(stack1)
    print(stack2)
    
    var same : Int = 0
    var all : Int = 0
    
    for element in stack1 {
        
        if let exist = stack2[element.key]{
            same += min(element.value , exist)
            all += max(element.value, exist)
            stack2.removeValue(forKey: element.key)
        }else{
        
        //교집합이 되지 않은 stack1
        all += element.value
            
        }
        
    }
    
    
    for element in stack2 {
        all += element.value
    }
    
    print(same)
    print(all)
    
    if same == 0 && all == 0 {
        return 65536
    }
    
    return  Int((Double(same) / Double(all)) * 65536)
}


let str1 = "aa1+aa2"
let str2 = "AAAA12"

print(solution(str1, str2))
