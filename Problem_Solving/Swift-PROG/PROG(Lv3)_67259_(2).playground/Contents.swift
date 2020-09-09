import UIKit

func solution(_ board:[[Int]]) -> Int {
        
    let LR : [Int] = [1,-1,0,0]
    let UD : [Int] = [0,0,1,-1]
    
    var check : [[Int]] = Array(repeating: Array(repeating: Int.max, count: board.count), count: board.count)
    
    var queue : [(x : Int , y : Int , before : Int , cnt : Int, corner : Int)] = []
    
    queue.append((0,0,-1,0,0))
    check[0][0] = 0
    
    while !queue.isEmpty{
        
        let item = queue.first!
        
        var next_queue = queue[1..<queue.count]
        
        let x = item.x
        let y = item.y
        let before = item.before
        let cnt = item.cnt
        let corner = item.corner
        
        for next in 0..<4{
            
            let nextX = x + LR[next]
            let nextY = y + UD[next]
            
            if (0..<board.count).contains(nextX) && (0..<board.count).contains(nextY){
                
                
                if board[nextY][nextX] == 0 {
                    
                    if (0...1).contains(before){
                        
                        //코너를 돌았다
                        if (2...3).contains(next){
                            
                            let total = (corner + 1) * 500 + (cnt + 1) * 100
                            
                            if check[nextY][nextX] >= total {
                                check[nextY][nextX] = total
                                next_queue.append((x: nextX, y: nextY, before: next, cnt: cnt + 1, corner: corner + 1))
                            }
                            
                        }
                            //아니다
                        else{
                            
                            let total = corner * 500 + (cnt + 1) * 100
                            

                            if check[nextY][nextX] >= total {
                              check[nextY][nextX] = total
                              next_queue.append((x: nextX, y: nextY, before: next, cnt: cnt + 1, corner: corner))
                            }
                        }
                        
                    }
                    else if (2...3).contains(before){
                        
                        //코너를 돌았다
                        if (0...1).contains(next){
                            
                            
                            let total = (corner + 1) * 500 + (cnt + 1) * 100
                            
                            if check[nextY][nextX] >= total {
                                check[nextY][nextX] = total
                                next_queue.append((x: nextX, y: nextY, before: next, cnt: cnt + 1, corner: corner + 1))
                            }
                        }
                            //아니다
                        else{
                            
                            let total = (corner) * 500 + (cnt + 1) * 100
                            
                            if check[nextY][nextX] >= total {
                                check[nextY][nextX] = total
                                next_queue.append((x: nextX, y: nextY, before: next, cnt: cnt + 1, corner: corner))
                            }
                        }
                        
                        
                    }
                    else{
                        
                        let total = (corner) * 500 + (cnt + 1) * 100
                        
                        if check[nextY][nextX] >= total {
                            check[nextY][nextX] = total
                            next_queue.append((x: nextX, y: nextY, before: next, cnt: cnt + 1, corner: corner))
                        }
                    }
                    
                    
                }
                
            }
            
        }
        
        
        queue = Array(next_queue)
        
    }
    
//    for element in check{
//        print(element)
//    }

    
    return check[board.count - 1][board.count - 1]
}

let board = [[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]]

print(solution(board))

