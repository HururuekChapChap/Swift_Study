import UIKit

var p : Int = 1987

func solution(_ p:Int) -> Int
{
    var answer = 0
    var currentNum = p + 1
    var arr = Array(repeating: 0, count: 10)
    var tempNum = String(currentNum).map { (char) -> String in
        String(char)
    }
    
    var index = 0
    while(index < tempNum.count){
        
        
        if arr[Int(tempNum[index])!] == 0 {
            arr[Int(tempNum[index])!] = 1
            index += 1
        }
        else{
            
            arr = Array(repeating: 0, count: 10)
            index = 0
            currentNum += 1
            tempNum = String(currentNum).map { (char) -> String in
            String(char)
        }
            
        
    }
    
    }
    
    answer = currentNum
    print(currentNum)

    return answer
}

solution(p)
