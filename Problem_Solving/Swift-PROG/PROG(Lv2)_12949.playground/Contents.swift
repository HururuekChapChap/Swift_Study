import UIKit

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var answer : [[Int]] = []
    
    for Y in arr1{
        
        var putArray : [Int] = []
        
        for index in 0..<arr2[0].count{
            
            var total = 0
            
            for (yndex , element) in Y.enumerated() {
            
                total += element * arr2[yndex][index]
            
            }
            
            putArray.append(total)
            
        }
        
        answer.append(putArray)
        
    }
    
    return answer
}

let arr1 = [[1,1], [1,1]]
let arr2 = [[2,2,2],[2,2,2],[2,2,2]]

print(solution(arr1, arr2))


//1 1.   2 2 2
//1 1.   2 2 2
