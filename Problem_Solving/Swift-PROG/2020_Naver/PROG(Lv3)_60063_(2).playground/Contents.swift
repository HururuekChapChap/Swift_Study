import UIKit

typealias tuple = (x1 : Int , y1 : Int , x2 : Int , y2 : Int , com : String, cnt : Int, i : Int)

func solution(_ board:[[Int]]) -> Int {

    var visited : [[Int]] = Array(repeating: Array(repeating: Int.max, count: board.count), count: board.count)

    var checkBox : Set<String> = []

    var queue : [tuple] = [(0,0,1,0,"Ka",0,-1)]

    visited[0][0] = 0
    visited[0][1] = 0

    checkBox.insert("0010")
    
    var temp : Set<String> = []
    temp.insert("000100")

    let UD : [Int] = [1,-1,0,0]
    let LR : [Int] = [0,0,1,-1]

    while !queue.isEmpty {

        let item = queue.removeLast()

        
        //최소값이 아닌데, 최소값으로 출력이 된 거고
        
//        print(item)

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



                    nextX2 = nextX1
                    nextY2 = nextY1 + rotate[i%4]
                    com = "Se"

                    }
                    else{
                        continue
                    }

                }
                else if item.com == "Se"{

                    if (0..<board.count).contains(nextY1 + 1 ) && (0..<board.count).contains(nextX1 + rotate[i%4]){

                    if board[nextY1 + 1 ][nextX1 + rotate[i%4]] == 1{
                        continue
                    }


                    nextX2 = nextX1 + rotate[i%4]
                    nextY2 = nextY1
                    com = "Ka"

                    }
                    else{
                        continue
                    }
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



                    nextX1 = nextX2
                    nextY1 = nextY2 + rotate[i%6]
                    com = "Se"

                    }
                    else{
                        continue
                    }
                }
                else if item.com == "Se"{

                    if (0..<board.count).contains(nextY2 - 1 ) && (0..<board.count).contains(nextX2 + rotate[i%6]){

                    if board[nextY2 - 1 ][nextX2 + rotate[i%6]] == 1{
                        continue
                    }



                    nextX1 = nextX2 + rotate[i%6]
                    nextY1 = nextY2
                    com = "Ka"

                    }
                    else{
                        continue
                    }
                }


            }


            if (0..<board.count).contains(nextX1) && (0..<board.count).contains(nextX2) && (0..<board.count).contains(nextY1) && (0..<board.count).contains(nextY2) {


                if board[nextY1][nextX1] != 1 && board[nextY2][nextX2] != 1 {


                    let min1 = min(visited[nextY1][nextX1], cnt + 1)
                    let min2 = min(visited[nextY2][nextX2], cnt + 1)
                    
                    if i == 5 || i == 6 {

                            let makeString = "\(nextX2)\(nextY2)\(nextX1)\(nextY1)"
                            let tempString = "\(nextX2)\(nextY2)\(min2)\(nextX1)\(nextY1)\(min1)"
                        
                        if checkBox.contains(makeString){
                            
                            if visited[nextY1][nextX1] >= cnt + 1 || visited[nextY2][nextX2] >= cnt + 1 {
                                
                                
                                if temp.contains(tempString){continue}
                                
                                temp.insert(tempString)
                                visited[nextY1][nextX1] = min(visited[nextY1][nextX1], cnt + 1)
                                visited[nextY2][nextX2] = min(visited[nextY2][nextX2], cnt + 1)
                                queue.insert((nextX2 , nextY2 , nextX1, nextY1, com, cnt + 1,i), at: 0)
                                
                            }
                            
                        }
                        else{
                            checkBox.insert(makeString)
                            temp.insert(tempString)
                            
                            visited[nextY1][nextX1] = min(visited[nextY1][nextX1], cnt + 1)
                            visited[nextY2][nextX2] = min(visited[nextY2][nextX2], cnt + 1)
                            queue.insert((nextX2 , nextY2 , nextX1, nextY1, com, cnt + 1,i), at: 0)
                        }
                        
                        }
                    else{

                            let makeString = "\(nextX1)\(nextY1)\(nextX2)\(nextY2)"
                        let tempString = "\(nextX1)\(nextY1)\(min1)\(nextX2)\(nextY2)\(min2)"
                            
                        if checkBox.contains(makeString){
                            
                            if visited[nextY1][nextX1] >= cnt + 1 || visited[nextY2][nextX2] >= cnt + 1 {
                             
                                if temp.contains(tempString){continue}
                                
                                
                                temp.insert(tempString)
                                visited[nextY1][nextX1] = min(visited[nextY1][nextX1], cnt + 1)
                                visited[nextY2][nextX2] = min(visited[nextY2][nextX2], cnt + 1)
                                queue.insert((nextX1 , nextY1 , nextX2, nextY2, com, cnt + 1,i), at: 0)
                                
                                
                            }
                            
                        }
                        else{
                            
                            checkBox.insert(makeString)
                            temp.insert(tempString)
                            visited[nextY1][nextX1] = min(visited[nextY1][nextX1], cnt + 1)
                            visited[nextY2][nextX2] = min(visited[nextY2][nextX2], cnt + 1)
                            queue.insert((nextX1 , nextY1 , nextX2, nextY2, com, cnt + 1,i), at: 0)
                            
                        }
                                

                        }



                    }

                }


            }

        }


//    print(checkBox)

    return visited[board.count - 1][board.count - 1]
}

let board : [[Int]] =  [[0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 1, 1, 1, 1, 1, 1, 1, 1], [0, 0, 1, 1, 1, 1, 1, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0], [1, 1, 1, 1, 1, 1, 1, 1, 0]]
print(solution(board))

