import UIKit

func solution(_ maze:[[Int]]) -> Int {
    
    var currentX = 1
    var currentY = 1
    
    var cnt = 0
    
    var newmaze = Array(repeating: Array(repeating: 1, count: maze.count + 2), count: maze.count + 2)
    
    for yindex in 1..<newmaze.count-1{
        
        for xindex in 1..<newmaze.count-1{
            
            newmaze[yindex][xindex] = maze[yindex - 1][xindex - 1]
            
        }
        
    }
    
//    for element in newmaze{
//        print(element)
//    }
        
    var direction = "S"
    
//    print(newmaze.count - 2)
    
    while currentX != newmaze.count - 2 || currentY != newmaze.count - 2{
        
//        print(currentY , currentX , direction)
        
        if direction == "S"{
            
            
            if newmaze[currentY][currentX + 1] == 1 {
                
            
                let temp = currentY + 1
                
                if newmaze[temp][currentX] == 1 {
                    
                    direction = "W"
                }
                else{
                    currentY = temp
                    cnt += 1
                }
                
            }
            else{
               
                currentX += 1
                cnt += 1
                direction = "E"
            }
            
        }
        else if direction == "E"{
            
            if newmaze[currentY - 1][currentX] == 1{
                let temp = currentX + 1
                
                if newmaze[currentY][temp] == 1{
                    direction = "S"
                }
                else{
                    currentX = temp
                    cnt += 1
                }
            }
            else{
                currentY -= 1
                cnt += 1
                direction = "N"
            }
            
            
        }
        else if direction == "N"{
            
            if newmaze[currentY][currentX - 1] == 1{
                
                let temp = currentY - 1
                
                if newmaze[temp][currentX] == 1{
                    direction = "E"
                }
                else{
                    currentY = temp
                    cnt += 1
                }
                
            }
            else{
                currentX -= 1
                cnt += 1
                direction = "W"
            }
            
            
        }
        else if direction == "W"{
            
            if newmaze[currentY + 1][currentX] == 1{
                
                let temp = currentX - 1
                
                if newmaze[currentY][temp] == 1{
                    direction = "N"
                }
                else{
                    currentX = temp
                    cnt += 1
                }
                
            }
            else{
                currentY += 1
                cnt += 1
                direction = "S"
            }
            
            
        }
        
    }
    
//    print(cnt)
    
    
    return cnt
}

let maze = [[0,1,0],[0,1,0],[0,0,0]]
solution(maze)
