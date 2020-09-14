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

let ball = [5,4,3,2,1]
let order = [3,4,2,5,1]

print(solution(ball, order))

/*
 
 원기둥이 있는데, 그 원기둥 안에 숫자들이 들어 있다.
 그리고 명령이 주어지는데, 원기등에서 그 명령에 해당하는 숫자를 빼는 문제였다.
 그러나 앞뒤에 해당하는 숫자만 뺄수가 있다. 앞뒤에 해당하지 않는데, 명령이 불렸더라면
 나중에 앞 뒤에 그 숫자가 오면 자동으로 빼주는 것이다.
 
 그래서 빼진 순서를 반환하는 문제였다.
 
 
 */
