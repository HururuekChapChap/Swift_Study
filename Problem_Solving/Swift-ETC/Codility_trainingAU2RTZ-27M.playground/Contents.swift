import UIKit

public func solution(_ N : Int) -> Int {
    
    let binaryString = String(N , radix: 2)
    
    print(binaryString)
    
    var cnt = 0
    var binaryGap = -1
    var maxValue = 0
    
    for (_ , element) in binaryString.enumerated() {
        
        if element == "0" {
            cnt += 1
        }
        else {
            binaryGap += 1
            
            maxValue = max(maxValue , cnt)
            
            cnt = 0
            
        }
        
        
    }
    
    print(binaryGap)
    print(maxValue)
    
    return maxValue
}

let N = 20

print(solution(N))
