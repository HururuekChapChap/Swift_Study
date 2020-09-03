import UIKit

func solution(_ land:[[Int]]) -> Int{
    
    var newLand : [[Int]] = []
    
    for (index ,element) in land.enumerated() {
        
        var tempLand : [Int] = Array(repeating: 0, count: 4)
        
        if index == 0 {
            newLand.append(element)
            continue
        }
        
        for plus in 0..<4{
        
        for start in 0..<4{
            
            if plus == start {
                continue
            }
            
            if newLand[index - 1][plus] + element[start] > tempLand[start] {
                tempLand[start] = newLand[index - 1][plus] + element[start]
            }
            
        }
            
            
        }
        
         newLand.append(tempLand)
        
    }
    
    let answer = newLand.last!.max()!
    
    return answer
}

let land = [[1,2,3,5],[5,1,1,3],[3,3,5,1],[3,4,2,6],[1,43,5,4],[24,14,90,97]]
print(solution(land))
