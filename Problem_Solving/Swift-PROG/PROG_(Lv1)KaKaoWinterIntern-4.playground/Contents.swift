import UIKit

let board = [[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]


let UD = [0,0,-1,1]
let RL = [1,-1,0,0]

var maxCost : Int = 987654321

func CostDFS(_ x : Int , _ y : Int, _ root : [[Int]], _ cost : Int ,_ visited : [[Int]], _ move : String ){
    
    var tempVisited = visited
    
    if x == board.count - 1 && y == board.count - 1 {
           
        if cost < maxCost{
            maxCost = cost
        }
    
    }
    else{
    
        for i in 0..<4{
            
            let nextX = x + RL[i]
            let nextY = y + UD[i]
            
            if nextX >= 0 && nextX < board.count && nextY >= 0 && nextY < board.count {
                
                
                if root[nextY][nextX] == 1 && visited[nextY][nextX] == 0 {
                    
                    tempVisited[nextY][nextX] = 1
                    
                    if move == "S"{
                     
                        //직선이동
                        if x != nextX && y == nextY {
                                               
                            CostDFS(nextX, nextY, root, cost + 100, tempVisited, "S")
                                               
                        }
                        //코너
                        else if x == nextX && y != nextY {
                                               
                            CostDFS(nextX, nextY, root, cost + 500, tempVisited, "C")
                                               
                        }
                        
                    }
                    else if move == "C"{
                        
                        //직선이동
                        if x != nextX && y == nextY {
                                               
                            CostDFS(nextX, nextY, root, cost + 500, tempVisited, "C")
                                               
                        }
                        //코너
                        else if x == nextX && y != nextY {
                                               
                            CostDFS(nextX, nextY, root, cost + 100, tempVisited, "S")
                                               
                        }
                        
                        
                    }
                    else if move == ""{
                        
                        CostDFS(nextX, nextY, root, cost + 100, tempVisited, "S")
                        
                    }
                    
                    tempVisited[nextY][nextX] = 0
                    
                }
                
            }
            
        }
        
    }
    
    
}

func DFS(_ x : Int , _ y : Int , _ visited : [[Int]], _ board : [[Int]]){
    
    var tempVisited = visited
    
    if x == board.count - 1 && y == board.count - 1 {
        
     var tempVisited : [[Int]] =  Array(repeating: Array(repeating: 0,count:board.count ), count: board.count)
        tempVisited[0][0] = 1
        
        //print(visited)
        CostDFS(0, 0, visited, 100, tempVisited, "")
        //print("")
    }
    else{
        
        for i in 0..<4{
            
            let nextX = x + RL[i]
            let nextY = y + UD[i]
            
            if nextX >= 0 && nextX < board.count && nextY >= 0 && nextY < board.count {
                
                
                if visited[nextY][nextX] == 0 && board[nextY][nextX] == 0{
                    
                    tempVisited[nextY][nextX] = 1
                    //print(tempList)
                    DFS(nextX, nextY, tempVisited, board)
                    tempVisited[nextY][nextX] = 0
                }
                
            }
            
        }
        
        
    }
    
}

func solution(_ board:[[Int]]) -> Int {
    
    var visited : [[Int]] =  Array(repeating: Array(repeating: 0,count:board.count ), count: board.count)
    visited[0][0] = 1
    DFS(0, 0, visited, board)
    
    print(maxCost)
    return 0
}

solution(board)
