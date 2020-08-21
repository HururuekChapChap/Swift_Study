import UIKit

func solution(_ n:Int, _ m:Int) -> [Int] {
    
  var tempN = n
  var tempM = m
  var divid = 2

  var 약수 = 1
    
    while divid <= tempN && divid <= tempM{
    
        if (tempN % divid == 0) && (tempM % divid == 0) {
            tempN = tempN / divid
            tempM = tempM / divid
            약수 *= divid
            divid = 2
            continue
        }
        
        divid += 1
        
    }
    
    return [약수, 약수 * tempN * tempM]
}


print(solution(4, 4))

 
