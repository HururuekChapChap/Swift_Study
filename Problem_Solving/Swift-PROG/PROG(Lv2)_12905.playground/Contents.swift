import UIKit


func solution(_ board:[[Int]]) -> Int
{
    var answer:Int = 0
        
    var map = board
    let ylenght = board.count
    let xlenght = board[0].count

//    for (yndex , ylement) in board.enumerated() {
//
//
//        for (xndex, xlement ) in ylement.enumerated() {
//
////            print(yndex , xndex)
//            if xlement == 1 {
//
//            if yndex == 0 || xndex == 0 {
//                map[yndex][xndex] = xlement
//            }
//            else{
//
//                map[yndex][xndex] = min(map[yndex][xndex - 1], map[yndex - 1][xndex] , map[yndex - 1][xndex - 1] ) + 1
//            }
//
//            answer = max(answer , map[yndex][xndex])
//
//            }
//        }
//
//    }

    for yndex in 0..<ylenght {
            
        for xndex in 0..<xlenght {
                

            
                if map[yndex][xndex] == 1 {
                        

                    
                if yndex != 0 && xndex != 0 {
                            
                    
                map[yndex][xndex] = min(map[yndex][xndex - 1], map[yndex - 1][xndex] , map[yndex - 1][xndex - 1] ) + 1
                    

            
                }
                    
                    answer = max(answer , map[yndex][xndex])
                        
                    }
            
            }
            
        }
        
 
    return answer * answer
}

//0 0 1 1
//1 1 1 1

let board : [[Int]] = [[0,1,1,1],[1,1,1,1]]
print(solution(board))

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
