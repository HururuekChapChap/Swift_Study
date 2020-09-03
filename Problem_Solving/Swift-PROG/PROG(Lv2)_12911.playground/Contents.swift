import UIKit

func solution(_ n:Int) -> Int
{
    
    let inputBinary = String(n, radix: 2)
    
    let countOne = inputBinary.filter { (char) -> Bool in
        return char == "1"
    }.count
        
    print(countOne)
    
    var nextNumber = n
    var nextCount = 0
    
    repeat{
        
        nextNumber += 1
        
        nextCount = String(nextNumber ,radix : 2).filter { (char) -> Bool in
            return char == "1"
        }.count
        
    } while (countOne != nextCount)
    
    return nextNumber
}

print(solution(15))
