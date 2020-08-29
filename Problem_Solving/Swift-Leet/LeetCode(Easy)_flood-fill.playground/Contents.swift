import UIKit

class Solution {
    
    let UD : [Int] = [1,-1,0,0]
    let LR : [Int] = [0,0,1,-1]
    
    var visited : [[Bool]] = []
    
    func floodFill2(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        
        visited = Array(repeating: Array(repeating: false, count: image[0].count), count: image.count)
        
        var answer = image
        answer[sr][sc] = newColor
        visited[sr][sc] = true
        DFS(&answer, sc, sr, color: newColor, startColor: image[sr][sc])
        
        return answer
    }
    
    func DFS(_ image : inout [[Int]], _ x : Int , _ y : Int , color: Int, startColor : Int){
        
        for time in 0..<4 {
            
            let nextX = x + LR[time]
            let nextY = y + UD[time]
            
            if nextX >= 0 && nextX < image[0].count && nextY >= 0 && nextY < image.count {
                
                if image[nextY][nextX] == startColor && visited[nextY][nextX] == false{
                    visited[nextY][nextX] = true
                    image[nextY][nextX] = color
                    DFS(&image, nextX, nextY, color: color, startColor: startColor)
                }
                
            }
            
        }
        
    }
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
          
        var answer = image
        BFS(&answer, newColor, sr, sc)
        
        return answer
      }
    
    
    func BFS(_ image : inout [[Int]],_ newColor : Int, _ row : Int, _ cow : Int){
        
        if image[row][cow] == newColor{
            return
        }
        
        let originColor = image[row][cow]
        var queue : [(row : Int , cow : Int)] = []
        image[row][cow] = newColor
        queue.append((row, cow))
        
        while !queue.isEmpty{
            
            let x = queue.first!.cow
            let y = queue.first!.row
            
            queue.removeFirst()
            
            for item in 0..<4 {
                
                let nextX = x + LR[item]
                let nextY = y + UD[item]
                
                if nextX >= 0 && nextX < image[0].count && nextY >= 0 && nextY < image.count {
                 
                    if image[nextY][nextX] == originColor {
                        image[nextY][nextX] = newColor
                        queue.append((nextY,nextX))
                    }
                    
                    
                }
                
                
                
            }
            
            
        }
        
        
    }
}

let image = [[1,1,1],[1,1,0],[1,0,1]]
let sr = 1, sc = 1, newColor = 2

print(Solution().floodFill(image, sr,sc, newColor))

//
//0 0 1
//0 1 1
