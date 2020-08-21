import UIKit

var numbers = [1, 3, 4, 5, 8, 2, 1, 4, 5, 9, 5]
var hand = "right"

struct Hand{
    var x : Int
    var y : Int
}

struct Node{
    var x : Int
    var y : Int
    var cnt : Int
}

func SearchBFS(_ x : Int, _ y: Int, _ find: Int) -> Int{
    
    let UD = [0,0,-1,1]
    let RL = [1,-1,0,0]
    
    let map : [[Int]] = [
    [1,2,3], [4,5,6],[7,8,9],[-1,0,-2]
    ]
    var visited : [[Int]] = Array(repeating: Array(repeating: 0,count:3 ), count: 4)
    
    var queue : [Node] = []
    
    visited[y][x] = 1
    queue.append(Node(x: x, y: y, cnt: 0))
    
    while(!queue.isEmpty){
        
        let tempX = queue[0].x
        let tempY = queue[0].y
        let tempCnt = queue[0].cnt
        
       // print("\(tempX) \(tempY) \(tempCnt) \(map[tempY][tempX])")
        
        queue.remove(at: 0)
        
        if map[tempY][tempX] == find{
            return tempCnt
        }
        
        for i in 0..<4{
            
            let nextX = tempX + RL[i]
            let nextY = tempY + UD[i]
            
            if nextX >= 0 && nextX < 3 && nextY >= 0 && nextY < 4 {
                
                if visited[nextY][nextX] == 0 {
                    
                    visited[nextY][nextX] = 1
                    
                    queue.append(Node(x: nextX, y: nextY, cnt: tempCnt + 1))
                    
                }
                
            }
            
            
        }
        
    }
    
    return 0
}

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    let map : [[Int]] = [
    [1,2,3], [4,5,6],[7,8,9],[-1,0,-2]
    ]
    
    var answer : String = ""
    
    var currentLoc : [[Int]] = Array(repeating: Array(repeating: 0,count:3 ), count: 4)
//
//    for i in 0..<4{
//        for j in 0..<3{
//            print(currentLoc[i][j], terminator : " ")
//        }
//        print("")
//    }
    
    var leftHand = Hand(x: 0, y: 3)
    var rightHand = Hand(x: 2, y: 3)
    currentLoc[leftHand.y][leftHand.x] = 1
    currentLoc[rightHand.y][rightHand.x] = 2
    
    for item in numbers{


        if item == 1 || item == 4 || item == 7 {

            currentLoc[leftHand.y][leftHand.x] = 0

            if item == 1{
                leftHand.y = 0
                leftHand.x = 0
            }
            else if item == 4{
                leftHand.y = 1
                leftHand.x = 0
            }
            else if item == 7{
                leftHand.y = 2
                leftHand.x = 0
            }
            
            answer += "L"
            currentLoc[leftHand.y][leftHand.x] = 1

        }
        else if item == 3 || item == 6 || item == 9 {

             currentLoc[rightHand.y][rightHand.x] = 0

            if item == 3{
                rightHand.y = 0
                rightHand.x = 2
            }
            else if item == 6{
                rightHand.y = 1
                rightHand.x = 2
            }
            else if item == 9{
                rightHand.y = 2
                rightHand.x = 2
            }
            answer += "R"
            currentLoc[rightHand.y][rightHand.x] = 2

        }
        else if item == 2 || item == 5 || item == 8 || item == 0 {

            let leftCnt = SearchBFS(leftHand.x, leftHand.y, item)
            let rightCnt = SearchBFS(rightHand.x, rightHand.y, item)
            
           // print("\(item) \(leftCnt) \(rightCnt)")
            
            if leftCnt < rightCnt {
                currentLoc[leftHand.y][leftHand.x] = 0
                
                if item == 2{
                    leftHand.y = 0
                    leftHand.x = 1
                           }
                else if item == 5{
                    leftHand.y = 1
                    leftHand.x = 1
                           }
                else if item == 8{
                    leftHand.y = 2
                    leftHand.x = 1
                           }
                else if item == 0 {
                    leftHand.y = 3
                    leftHand.x = 1
                }
                answer += "L"
                currentLoc[leftHand.y][leftHand.x] = 1
                
            }
            else if leftCnt > rightCnt{
                currentLoc[rightHand.y][rightHand.x] = 0
                
                if item == 2{
                    rightHand.y = 0
                    rightHand.x = 1
                            }
                else if item == 5{
                    rightHand.y = 1
                    rightHand.x = 1
                            }
                else if item == 8{
                    rightHand.y = 2
                    rightHand.x = 1
                            }
                else if item == 0 {
                    rightHand.y = 3
                    rightHand.x = 1
                              }
                answer += "R"
                currentLoc[rightHand.y][rightHand.x] = 2
            }
            else {
                
                if hand == "right"{
                    currentLoc[rightHand.y][rightHand.x] = 0
                    
                    if item == 2{
                        rightHand.y = 0
                        rightHand.x = 1
                                }
                    else if item == 5{
                        rightHand.y = 1
                        rightHand.x = 1
                                }
                    else if item == 8{
                        rightHand.y = 2
                        rightHand.x = 1
                                }
                    else if item == 0 {
                        rightHand.y = 3
                        rightHand.x = 1
                                  }
                    answer += "R"
                    currentLoc[rightHand.y][rightHand.x] = 2
                }
                else if hand == "left"{
                 
                    currentLoc[leftHand.y][leftHand.x] = 0
                    
                    if item == 2{
                        leftHand.y = 0
                        leftHand.x = 1
                               }
                    else if item == 5{
                        leftHand.y = 1
                        leftHand.x = 1
                               }
                    else if item == 8{
                        leftHand.y = 2
                        leftHand.x = 1
                               }
                    else if item == 0 {
                        leftHand.y = 3
                        leftHand.x = 1
                    }
                    answer += "L"
                    currentLoc[leftHand.y][leftHand.x] = 1
                }
                
            }

        }

    }
    

    return answer
}
print(solution(numbers, hand))


//print(SearchBFS(0,0,0))
