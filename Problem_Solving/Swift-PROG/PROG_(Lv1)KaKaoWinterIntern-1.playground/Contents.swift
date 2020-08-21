import UIKit

let board : [[Int]] = [[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]]
let moves : [Int] = [1,5,3,5,1,2,1,4]

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var tempBoard = board
    var stack : [Int] = []
    var removedNum = 0
    
    let len = board[0].count

    for index in moves{
        
        var pushNum = 0
        
        for goDown in 0..<len{
        
            if(tempBoard[goDown][index - 1] != 0){
                pushNum = tempBoard[goDown][index - 1]
                tempBoard[goDown][index - 1] = 0
                break
            }
            
        }
        
        print("pushNum : \(pushNum) index : \(index)")
        if pushNum != 0 {

            if stack.isEmpty {
                stack.append(pushNum)
            }
            else{

                let topNum = stack[stack.count - 1]

                if topNum == pushNum {
                    stack.remove(at: stack.count - 1)
                    removedNum += 2
                }
                else{
                    stack.append(pushNum)
                }

            }

        }
        
        
    }
    
    return removedNum
}

print(solution(board, moves))
