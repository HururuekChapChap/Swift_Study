import UIKit

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    
    var new = Array(repeating: Array(repeating: 0, count: arr1[0].count), count: arr1.count)
    
    for indexY in 0..<new.count {
        for indexX in 0..<new[indexY].count {
            new[indexY][indexX] = arr1[indexY][indexX] + arr2[indexY][indexX]
        }
    }
    
    return new
}

let arr1 = [[1,2],[2,3]]
let arr2 = [[3,4],[5,6]]

print(solution(arr1, arr2))

