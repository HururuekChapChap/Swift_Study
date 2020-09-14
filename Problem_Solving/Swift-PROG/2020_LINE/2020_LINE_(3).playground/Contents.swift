import UIKit

var minValue = Int.max
var answer = 0
var answerList : [String] = []
func solution(_ n:Int) -> [Int] {
    
    let makeString = String(n).map { (char) -> String in
        return String(char)
    }
    
    DFS(makeString, 0)
    
    print(answerList)
    
    return [minValue , answer]
}

func DFS(_ currentNum : [String], _ cnt : Int){
    
    if currentNum.count == 1 {
        
        
        
        if cnt < minValue {
            answerList = []
            minValue = cnt
            answer = Int(currentNum.joined())!
            answerList.append(currentNum.joined())
        }
        else if cnt == minValue{
            answerList.append(currentNum.joined())
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

let n = 73425

print(solution(n))

/*
 
 10억 이하의 숫자가 주어진다.
 그리고 이 숫자를 특정 부위에서 잘라서 합한다.
 예를들어 7349 라 한다면
 7 + 349 라던지 73 + 49 던지 이렇게 더해서
 가장 빠르게 일의 자리 수를 만드는 횟수를 찾고
 그 해당하는 수를 반환해라
 이때 반환하는 수는 상관이 없다.
 또한 0을 제외하고 000 이나 09는 유효하지 않는 수이다.
 
 */

//3 480 -> 483 -> 4 83 -> 87
//                48 3 -> 51
//
//34 80 -> 114 -> 1 14 -> 15
//                11 4 -> 15
//
//348 0 -> 348 -> 3 48 -> 51
//                34 8 -> 42
