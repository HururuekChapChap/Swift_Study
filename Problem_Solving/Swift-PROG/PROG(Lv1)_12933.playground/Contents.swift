import UIKit

func solution(_ n:Int64) -> Int64 {
    
    let listnum = Array(String(n)).map { (single) -> Int64 in
        return Int64(String(single))!
    }.sorted(by: >)
    
    var answer : Int64 = 0
    
    for element in listnum{
        answer = answer * 10 + element
    }
    
    
    return answer
}

let n : Int64 = 899999999

solution(n)
