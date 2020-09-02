import UIKit


func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
        
    var cnt = 0
    
    for Y in board {
        
        for X in Y{
            
            if X == 1 {
                cnt += 1
            }
            
        }
        
    }

    answer = cnt / board.count
    
    return answer * answer
}

let board : [[Int]] = [[0,1],[1,1,1,1]]
solution(board)

let UD : [Int] = [1,-1,0,0]
let LR : [Int] = [0,0,1,-1]

func isPossible(_ currentX : Int, _ currentY : Int,_ direction : String,_ total : Int ,_ board : [[Int]]) -> Int{
    
    var cnt = 0
    
    print(currentX , currentY)
    
    if direction == "E"{
        
        
        for index in currentX..<board.count {
            
            cnt += 1
            
            if board[currentY][index] != 1 || index == board.count - 1{
                
                print(currentY , index, cnt)
                
                if cnt  <= 1 {
                    break
                }
                else {
                   return isPossible(currentX + cnt - 1 , currentY, "S", cnt, board)
                }
                
            }
            
   
        }
    }
    else if direction == "S"{
        
         for index in currentY..<board.count {
                 
            cnt += 1
            
            if board[index][currentX] != 1 || index == board.count - 1 || cnt == total{
                
                if cnt < total {
                    break
                }
                else {
                    return isPossible(currentX, currentY + total - 1, "W", total, board) == total ? total : 1
                }
                     
            }
            
        
        }
        
        
    }
    else if direction == "W"{
        
        for index in (0...currentX).reversed() {
                 
            cnt += 1
            
            if board[currentY][index] != 1 || index == 0 || cnt == total{
                
                if cnt < total {
                    break
                }
                else {
                    return isPossible(currentX - cnt + 1, currentY, "N", total, board) == total ? total : 1
                }
                     
            }
                 
        
        }
        
    }
    else if direction == "N"{
        
        for index in (0...currentY).reversed(){
            
            cnt += 1
            
            if board[index][currentX] != 1 || index == 0 || cnt == total{
                
                if cnt < total {
                    break
                }
                else {
                    return total
                }
                     
            }
            
        }
        
    }
    
    
    return 1
}


//for index in (0...10).reversed() {
//    print(index)
//}



//print(isPossible(3, 0, "E", 0, board))
