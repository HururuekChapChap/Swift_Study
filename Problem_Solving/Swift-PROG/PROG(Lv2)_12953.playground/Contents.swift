import UIKit

func solution(_ arr:[Int]) -> Int {
    
    if arr.count == 1 {
        return arr.first!
    }
    
    var toDivied = arr.min()!
    var flag = false
    
    while true {
        
        for (index , element) in arr.enumerated() {
            
            if toDivied % element != 0{
                break
            }
            
            if index == arr.count - 1 {
                flag = true
                break
            }
            
        }
        
        if flag {
            break
        }
        
        toDivied += arr.min()!
        
        
    }
    
    
    
    return toDivied
}

let arr = [1,2,3]
print(solution(arr))
