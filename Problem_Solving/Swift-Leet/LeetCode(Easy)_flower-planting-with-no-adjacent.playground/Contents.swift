import UIKit

class Solution {
    
    func gardenNoAdj(_ N: Int, _ paths: [[Int]]) -> [Int] {
        
        if N == 1 {return [1]}
        
        var nodes = Array(repeating: 0, count: N + 1)
        
        var graph : [Int : [Int]] = [:]
        
        
        for element in paths{
                
            if element.isEmpty{continue}
            
            graph[element[0], default : []].append(element[1])
            graph[element[1], default : []].append(element[0])
            
        }
        
        
        for node in 1...N{
            var flowers = Set([1,2,3,4])
            if let exist = graph[node]{
                
                for element in exist{
                    flowers.remove(nodes[element])
                }
                
                
            }
            
             nodes[node] = flowers.sorted().first!
            
        }
        
        nodes.removeFirst()
        
        return nodes
    }
    
}

let N = 4
let pathes : [[Int]] =  [[]]

Solution().gardenNoAdj(N, pathes)
