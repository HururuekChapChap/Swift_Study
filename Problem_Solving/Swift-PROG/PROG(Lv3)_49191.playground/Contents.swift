import UIKit

var winDict : [Int : [Int] ] = [:]
var lossDict : [Int : [Int] ] = [:]

func solution(_ n:Int, _ results:[[Int]]) -> Int {

    var answer = 0
    
    for connect in results{
        winDict[connect[0] , default : []].append(connect[1])
        lossDict[connect[1], default : []].append(connect[0])
    }
    
    for node in 1...n{
        
        var visited : [Bool] = Array(repeating: true, count: n+1)
        
        winBFS(&visited, node)
        lossBFS(&visited, node)
        
        visited.removeFirst()
        
        let count = visited.filter { (ele) -> Bool in
            return ele
        }.count
        
        print("\(node) \(count) : \(visited)")
        
        if count == 0 {
            answer += 1
        }
        
    }
    
    return answer
}

func lossBFS(_ visited : inout [Bool], _ node : Int){
    
    visited[node] = false
    var queue : [Int] = [node]
    
    while !queue.isEmpty{
        
        let node = queue.removeLast()
        
        for child in lossDict[node , default: []] {
            
            if visited[child] {
                
                visited[child] = false
                queue.insert(child, at: 0)
                
            }
            
        }
        
    }
    
}

func winBFS(_ visited : inout [Bool], _ node : Int){
    
    visited[node] = false
    var queue : [Int] = [node]
    
    while !queue.isEmpty{
        
        let node = queue.removeLast()
        
        for child in winDict[node , default: []] {
            
            if visited[child] {
                
                visited[child] = false
                queue.insert(child, at: 0)
                
            }
            
        }
        
    }
    
}

let n = 5
let results = [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5],[4,1],[3,1],[1,5]]

print(solution(n, results))
