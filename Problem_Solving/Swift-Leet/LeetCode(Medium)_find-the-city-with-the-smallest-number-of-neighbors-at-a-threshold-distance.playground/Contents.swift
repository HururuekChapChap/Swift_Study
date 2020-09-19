import UIKit

class Solution {
    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        
        var distanceMap = Array(repeating: Array(repeating: 10001, count: n), count: n)
       
        //초기설정
        for (_, yelement) in edges.enumerated(){
            
            let from = yelement[0]
            let to = yelement[1]
            let weight = yelement[2]
            
            distanceMap[from][to] = weight
            distanceMap[to][from] = weight
        
        }
        
        for node in 0..<n{
            distanceMap[node][node] = 0
        }
        
        //플로이드 워샬
        
        for middlePoint in 0..<n{
            
            for startPoint in 0..<n{
                
                for endPoint in 0..<n{
                    
                    if distanceMap[startPoint][middlePoint] + distanceMap[middlePoint][endPoint] < distanceMap[startPoint][endPoint]{
                        
                        distanceMap[startPoint][endPoint] = distanceMap[startPoint][middlePoint] + distanceMap[middlePoint][endPoint]
                        
                    }
                    
                    
                }
                
            }
            
        }
        
        var answer = 0
        var minValue = Int.max
        for (yindex , yelement) in distanceMap.enumerated(){
            
            var cnt = 0
            
            for (xindex , xelement) in yelement.enumerated(){
                
                if xindex != yindex{
                    
                    if xelement <= distanceThreshold{
                       cnt += 1
                    }
                    
                }
                
            }
            
            if minValue >= cnt {
                minValue = cnt
                answer = yindex
            }
            
        }
        
        return answer
    }
}

let n = 5
let edges =  [[0,1,2],[0,4,8],[1,2,3],[1,4,2],[2,3,1],[3,4,1]]
let distanceThreshold = 2

print(Solution().findTheCity(n, edges, distanceThreshold))
