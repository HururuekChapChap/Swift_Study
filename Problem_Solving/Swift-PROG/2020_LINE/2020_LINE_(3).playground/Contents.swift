import UIKit

var minValue = Int.max
var answer = 0

func solution(_ n:Int) -> [Int] {
    
    let makeString = String(n).map { (char) -> String in
        return String(char)
    }
    
    DFS(makeString, 0)
    
    
    
    return [minValue , answer]
}

func DFS(_ currentNum : [String], _ cnt : Int){
    
    if currentNum.count == 1 {
        
//        print(currentNum , cnt)
        
        if cnt < minValue {
            minValue = cnt
            answer = Int(currentNum.joined())!
        }
        
    }
    else{
        
        for i in 0..<currentNum.count - 1{
            
            let first = Int(Array(currentNum[0...i]).joined())!
            
            let test = Array(currentNum[i+1..<currentNum.count])
            
            if test.count > 1 , test[0] == "0" {
                continue
            }
            
            let last = Int(test.joined())!
            
            let makeString = String(first + last).map { (char) -> String in
                return String(char)
            }
            
            DFS(makeString, cnt + 1)
            
        }
        
    }
    
    
}

let n = 1000000000

print(solution(n))
