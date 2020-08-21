import UIKit

let n : Int64 = 11

func solution(_ n: Int64) -> Int64
{
    var answer:Int64 = 0

    var stack : [Int64] = [1,3,4]
    var current = 3
    var startNum : Int64 = 3
    if n < 4 {
        answer = stack[ Int(n)-1 ]
    }
    else{
        
        while(current <= n){
            
            startNum *= 3
            
            stack.append(startNum)
            current += 1
            
            let tempCount = stack.count - 1
            
            for index in 0..<tempCount{
                
                let tempNum = startNum + stack[index]
                
                stack.append(tempNum)
                
                current += 1
            }
            
            //print("current : \(current) tempCount : \(tempCount)")
            //print(stack)
            
        }
        
        
    }
    
    answer = stack[Int(n) - 1]
    print(answer)
    return answer
}


solution(n)
