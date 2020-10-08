import UIKit

typealias tuple = (x1 : Int , y1 : Int , x2 : Int , y2 : Int , com : String, cnt : Int)

func solution(_ board:[[Int]]) -> Int {
    
    var visited : [[Int]] = Array(repeating: Array(repeating: Int.max, count: board.count), count: board.count)
    
    var queue : [tuple] = [(1,0,1,1,"Se",0)]
    
    visited[0][0] = 0
    visited[0][1] = 0
    
    let UD : [Int] = [1,-1,0,0]
    let LR : [Int] = [0,0,1,-1]
    
    while !queue.isEmpty {
        
        let item = queue.removeLast()
        
        for i in 0..<8{
            
            var nextX1 = item.x1
            var nextY1 = item.y1
            var nextX2 = item.x2
            var nextY2 = item.y2
            var com = item.com
            let cnt = item.cnt
            
            if i < 4{
                
                nextX1 += LR[i]
                nextY1 += UD[i]
                
                nextX2 += LR[i]
                nextY2 += UD[i]
                
            }
            //로테이션 1이 기준 -> 2가 움직인다
            else if i < 6{
                
                let rotate = [1,-1]
                
                if item.com == "Ka"{
                    
                    if (0..<board.count).contains(nextY1 + rotate[i%4]) && (0..<board.count).contains(nextX1 + 1){
                    
                    if board[nextY1 + rotate[i%4] ][nextX1 + 1] == 1{
                        continue
                    }
                        
                    }
                    
                    nextX2 = nextX1
                    nextY2 = nextY1 + rotate[i%4]
                    com = "Se"
                    
                }
                else if item.com == "Se"{
                    
                    if (0..<board.count).contains(nextY1 + 1 ) && (0..<board.count).contains(nextX1 + rotate[i%4]){
                    
                    if board[nextY1 + 1 ][nextX1 + rotate[i%4]] == 1{
                        continue
                    }
                    }
                        
                    nextX2 = nextX1 + rotate[i%4]
                    nextY2 = nextY1
                    com = "Ka"
                }
                
            }
            //로테이션 2가 기준 -> 1이 움직인다.
            else{
                
                let rotate = [1,-1]
                
                if item.com == "Ka"{
                    
                    if (0..<board.count).contains(nextY2 + rotate[i%6] ) && (0..<board.count).contains(nextX2 - 1){
                    
                    if board[nextY2 + rotate[i%6] ][nextX2 - 1] == 1{
                        continue
                    }
                    
                }
                    
                    nextX1 = nextX2
                    nextY1 = nextY2 + rotate[i%6]
                    com = "Se"
                }
                else if item.com == "Se"{
                    
                    if (0..<board.count).contains(nextY2 - 1 ) && (0..<board.count).contains(nextX2 + rotate[i%6]){
                    
                    if board[nextY2 - 1 ][nextX2 + rotate[i%6]] == 1{
                        continue
                    }
                        
                    }
                    
                    nextX1 = nextX2 + rotate[i%6]
                    nextY1 = nextY2
                    com = "Ka"
                }
                
                
            }
            
            print("\(i) : ",nextX1 , nextY1 , nextX2 , nextY2)
            
            continue
            
            
            if (0..<board.count).contains(nextX1) && (0..<board.count).contains(nextX2) && (0..<board.count).contains(nextY1) && (0..<board.count).contains(nextY2) {
                
                
                if board[nextY1][nextX1] != 1 && board[nextY2][nextX2] != 1 {
                    
                    if visited[nextY1][nextX1] >= cnt + 1 || visited[nextY2][nextX2] >= cnt + 1 {
                        
                        visited[nextY1][nextX1] = min(visited[nextY1][nextX1], cnt + 1)
                        visited[nextY2][nextX2] = min(visited[nextY2][nextX2], cnt + 1)
                        
                        
                        queue.insert((nextX1 , nextY1 , nextX2, nextY2, com, cnt + 1), at: 0)
                        
                    }
                    
                }
                
                
            }
            
        }
       
        
    }
    
    
    return 0
}

let board : [[Int]] = [[0, 0, 0, 1, 1],[0, 0, 0, 1, 0],[0, 1, 0, 1, 1],[1, 1, 0, 0, 1],[0, 0, 0, 0, 0]]

solution(board)
