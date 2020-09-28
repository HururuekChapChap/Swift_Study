import UIKit

var visited : [Bool] = []
var cnt = 1
func solution(_ list : [Int]) {
    
    let new = list.sorted()
    visited = Array(repeating: true, count: list.count)
    
    permutaion(0, list.count, new, [])
    
}

func permutaion(_ current : Int ,_ max : Int ,_ list : [Int],_ result : [Int] ){
    
    var temp = result
    
    if current == max {
        
        print("\(cnt) : \(result)")
        cnt += 1
        
    }
    else{
        
        for start in 0..<max{
            
            if visited[start] {
                
                visited[start] = false
                temp.append(list[start])
                permutaion(current + 1, max, list, temp)
                temp.removeLast()
                visited[start] = true
                
            }
            
        }
        
    }
    
    
}

let number : [Int] = [1,2,3,4,5,6,7,8,9,10,11,12,13]
solution(number)
