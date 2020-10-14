import UIKit

class Solution {
    
    var visited : [[Int]] = []
    var answer = 0
    
    func maxDistance(_ grid: [[Int]]) -> Int {
        
        visited = Array(repeating: Array(repeating: -1, count: grid.count), count: grid.count)
    
        var queue : [(x: Int, y : Int, cnt : Int)] = []
        
        for y in 0..<grid.count{
            for x in 0..<grid.count{
            
                if grid[y][x] == 1 {
                    queue.append((x,y,0))
                    visited[y][x] = 0
                }
            }
        }
        
        while !queue.isEmpty{
            
            let UD : [Int] = [1,-1,0,0]
            let LR : [Int] = [0,0,1,-1]
            
            let item = queue.removeLast()
            
            answer = max(answer, visited[item.y][item.x])
            
            for i in 0..<4{
                
                let X = LR[i] + item.x
                let Y = UD[i] + item.y
                
                if (0..<grid.count).contains(X) && (0..<grid.count).contains(Y){
                 
                    if visited[Y][X] == -1 {
                        visited[Y][X] = item.cnt + 1
                        queue.insert((X,Y,item.cnt + 1), at: 0)
                    }
                    
                }
                
                
            }
            
            
        }
        
        
        
        return  answer <= 0 ? -1 : answer
        
    }
    
}

let input = [[1,1,1],[1,1,1],[1,1,1]]

print(Solution().maxDistance(input))
