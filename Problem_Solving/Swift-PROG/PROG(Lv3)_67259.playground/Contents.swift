import UIKit

var check : [[Bool]] = []

var LR : [Int] = [1,-1,0,0]
var UD : [Int] = [0,0,1,-1]

var minValue : Int = Int.max

var allCnt = 0
func solution(_ board:[[Int]]) -> Int {
    
    check = Array(repeating: Array(repeating: true, count: board.count), count: board.count)
    
    check[0][0] = false
    dfs(0, 0, -1, board, 0, 0)
    
    print(allCnt)
    
    return minValue
}

func dfs(_ currentX : Int , _ currentY : Int ,_ before : Int ,_ board : [[Int]],_ corner : Int,_ cnt : Int){
    
    
    
    if currentX == board.count - 1 && currentY == board.count - 1 {
        
        
        let total = ( corner * 500 ) + (cnt * 100)
        
        allCnt += 1
        minValue = min(total, minValue)
        
//        for element in check{
//            print(element)
//        }
//
        
        
    }
    else{
        
        for start in 0..<4 {
            
            let nextX = currentX + LR[start]
            let nextY = currentY + UD[start]
            
            if nextX >= 0 && nextX < board.count && nextY >= 0 && nextY < board.count {
                
                if check[nextY][nextX] && board[nextY][nextX] == 0{
                    
                    check[nextY][nextX] = false
                    
                    if (0...1).contains(before) {
//                        print("before LR")
                        //코너를 돌았다
                        if (2...3).contains(start){
//                            print("next corner")

                            let total = ((corner + 1) * 500 ) + ( (cnt + 1 ) * 100)
                            
                            if minValue > total{
                            
                            dfs(nextX, nextY, start, board, corner + 1, cnt + 1)
                                
                            }
                        }else{
//                            print("next 직선")
                            
                            let total = ((corner) * 500 ) + ( (cnt + 1 ) * 100)
                            
                            if minValue > total{
                            
                            dfs(nextX,nextY, start, board, corner , cnt + 1)
                                
                            }
                            
                            
                        }
                        
                    }
                    else if (2...3).contains(before){
//                        print("before UD")
                        if (2...3).contains(start){
//                            print("next 직선")
                            
                            let total = ((corner) * 500 ) + ( (cnt + 1 ) * 100)
                                                       
                            if minValue > total{
                                                       
                                dfs(nextX,nextY, start, board, corner , cnt + 1)
                                                           
                            }
                            
                        }
                        //코너를 돌았다.
                        else{
//                            print("next corner")
                            
                           let total = ((corner + 1) * 500 ) + ( (cnt + 1 ) * 100)
                            
                            if minValue > total{
                            
                            dfs(nextX, nextY, start, board, corner + 1, cnt + 1)
                                
                            }
                        }
                        
                    }
                    else{
                        
                        dfs(nextX,nextY, start, board,corner, cnt + 1)
                    }
                    
                    check[nextY][nextX] = true
                    
                    
                }
                
                
            }
            
            
            
        }
        
    }
    
    
}



let board = [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
print(solution(board))

//
//var check : [[Bool]] = []
//
//var LR : [Int] = [1,-1,0,0]
//var UD : [Int] = [0,0,1,-1]
//
//var maxValue : Int = Int.max
//func solution(_ board:[[Int]]) -> Int {
//
//    check = Array(repeating: Array(repeating: true, count: board.count), count: board.count)
//
//    check[0][0] = false
//    dfs(0, 0, 0, -1, board,[])
//
//    return maxValue
//}
//
//func dfs(_ currentX : Int , _ currentY : Int ,_ sum : Int ,_ before : Int ,_ board : [[Int]],_ list : [Int]){
//
//    var temp = list
//
//
//    if currentX == board.count - 1 && currentY == board.count - 1 {
//
//        let cornerCount = list.filter { (element) -> Bool in
//            return element == 500
//        }
//
//        let total = (cornerCount.count * 500) + (list.count * 100)
//
//        maxValue = min(maxValue , total)
//
//
//    }
//    else{
//
//        for start in 0..<4 {
//
//            let nextX = currentX + LR[start]
//            let nextY = currentY + UD[start]
//
//            if nextX >= 0 && nextX < board.count && nextY >= 0 && nextY < board.count {
//
//                if check[nextY][nextX] && board[nextY][nextX] == 0{
//
//                    check[nextY][nextX] = false
//
//                    if (0...1).contains(before) {
//
//                        //코너를 돌았다
//                        if (2...3).contains(start){
//
//                            temp.append(500)
//                            dfs(nextX, nextY, sum + 500, start, board, temp)
//                        }else{
//
//                            temp.append(100)
//                            dfs(nextX,nextY,sum + 100, start, board, temp)
//                        }
//
//                    }
//                    else if (2...3).contains(before){
//
//                        if (2...3).contains(start){
//
//                            temp.append(100)
//                            dfs(nextX,nextY,sum + 100, start, board,temp)
//                        }
//                        //코너를 돌았다.
//                        else{
//
//                            temp.append(500)
//                            dfs(nextX, nextY, sum + 500, start, board,temp)
//                        }
//
//                    }
//                    else{
//                        temp.append(100)
//                        dfs(nextX,nextY,sum + 100, start, board,temp)
//                    }
//
//                    check[nextY][nextX] = true
//                    temp.removeLast()
//
//                }
//
//
//            }
//
//
//
//        }
//
//    }
//
//
//}
//
