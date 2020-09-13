import UIKit

func solution(_ ball:[Int], _ order:[Int]) -> [Int] {
    
    var pipe = ball
    var checkDict : [Int : Bool] = [:]
    var answer : [Int] = []
    
    var index = 0
    
    while index < order.count {
        
        var firstItem = pipe.first!
        
        if pipe.count > 1{
            
            var lastItem = pipe.last!
            
//            print(firstItem , lastItem)
            
            while true{
                        
                var flag = false
//            print( "inside : ",firstItem , lastItem)
                
            if let _ = checkDict[firstItem]{
                answer.append(firstItem)
                pipe.removeFirst()
                firstItem = pipe.first!
                flag = true
            }
            
            if pipe.count > 1, let _ = checkDict[lastItem] {
                answer.append(lastItem)
                pipe.removeLast()
                lastItem = pipe.last!
                flag = true
            }
           
                if flag == false{
                    break
                }
                
            }
            
            if firstItem == order[index] {
                answer.append(firstItem)
                pipe.removeFirst()
            }
            else if lastItem == order[index]{
                answer.append(lastItem)
                pipe.removeLast()
            }
            else{
                
                checkDict[order[index]] = true
                
            }
            
            
        }
        else{
            answer.append(firstItem)
            pipe.removeFirst()
        }
        
        index += 1
        
        if pipe.isEmpty{
            break
        }
        
        
    }
    
//    print(answer)
    
    return answer
}

let ball = [11, 2, 9, 13, 24]
let order = [9, 2, 13, 24, 11]

print(solution(ball, order))
