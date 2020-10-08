import UIKit

class Solution {
    
    func numIslands(_ grid: [[Character]]) -> Int {
        
        if grid.isEmpty {return 0}
        
        var visited : [[Bool]] = Array(repeating: Array(repeating: true, count: grid[0].count), count: grid.count)
        
        var answer = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count{
                
                if visited[i][j] && grid[i][j] == "1"{
                    
                    answer += 1
                    BFS(j, i, &visited, grid)
                    
                    
                }
                
                
            }
        }
        
        return answer
    }
    
}

func BFS(_ x: Int ,_ y : Int ,_ visited : inout [[Bool]] ,_ grid : [[Character]]){
    
    let LR : [Int] = [1,-1,0,0]
    let UD : [Int] = [0,0,1,-1]
    
    var queue : [(x: Int , y : Int)] = [(x, y)]
    visited[y][x] = false
    
    while !queue.isEmpty {
        
        let item = queue.removeLast()
        
        for i in 0..<4{
            
            let nextX = item.x + LR[i]
            let nextY = item.y + UD[i]
            
            if (0..<grid.count).contains(nextY) && (0..<grid[0].count).contains(nextX) {
            
            if grid[nextY][nextX] == "1" && visited[nextY][nextX] {
                
                visited[nextY][nextX] = false
                queue.insert((nextX , nextY), at: 0)
                
            }
                
            }
            
        }
        
        
    }
    

}

let grid : [[Character]] = []

print(Solution().numIslands(grid))
