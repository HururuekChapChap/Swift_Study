import UIKit

var connected : [Int : [Int]] = [:]

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    for (yindex, y) in computers.enumerated(){
        for (xindex, x) in y.enumerated(){
            
            if xindex != yindex && x == 1 {
            
            connected[yindex , default : []].append(xindex)
                
            }
        }
    }
    
    print(connected)
    
     var visited = Array(repeating: false, count: n)
    var cnt = 0
    
    for node in 0..<n{

        if !visited[node]{
            BFS(node, &visited)
            cnt += 1
        }

    }

    print(visited)
    
    return cnt
}

func BFS(_ node : Int , _ visited : inout [Bool]){
    visited[node] = true
    var queue : [Int] = [node]
    
    while !queue.isEmpty {
        
        let first = queue.removeFirst()
        
        for element in connected[first, default:  []]{
            
            if !visited[element] {
                
                visited[element] = true
                queue.append(element)
                
            }
            
        }
        
        
    }
    
}

let n = 3

let computers = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]

print(solution(n, computers))

