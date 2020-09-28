import UIKit

var visited : [Bool] = []

func solution(_ n : Int, _ edges : [[Int]]) -> [Int]{
    
    visited = Array(repeating: false, count: edges.count)
    
    
    combination(0, 0, edges, n)
    
    
    return []
}

func combination(_ current : Int, _ index : Int, _ edges : [[Int]], _ n : Int) {
    
    if current == 2 {
        
        var dict : [Int : [Int]] = [:]
        
        for (index , element) in edges.enumerated(){
            
            if visited[index] == false{
            
            dict[element[0] , default : []].append(element[1])
            dict[element[1] , default : []].append(element[0])
                
            }
            
        }
                
        var nodeVisited : [Bool] = Array(repeating: false, count: n)
        
        var divid = -1
        var group = 0
        
        for node in 0..<n{
            
            if !nodeVisited[node]{
                
                nodeVisited[node] = true
                
                var queue : [Int] = [node]
                var cnt = 0
                
                while !queue.isEmpty{
                    
                    let item = queue.removeLast()
                    cnt += 1
                    
                    if let exist = dict[item] {
                        
                        for element in exist {
                            
                            if !nodeVisited[element] {
                                
                                nodeVisited[element] = true
                                queue.insert(element, at: 0)
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
                if divid == -1{
                    divid = cnt
                    group += 1
                }
                else if divid == cnt {
                    group += 1
                }
                

            }
            
        }
        
        if group == 3 {
            print(visited)
        }
        
        
    }
    else{
        
        for start in index..<visited.count {
            
            if visited[start] == false{
                visited[start] = true
                combination(current + 1, start + 1, edges , n)
                visited[start] = false
            }
            
        }
        
    }
    
}

let n = 9
let edges = [[0,2],[2,1],[2,4],[3,5],[5,4],[5,7],[7,6],[6,8]]

solution(n, edges)
