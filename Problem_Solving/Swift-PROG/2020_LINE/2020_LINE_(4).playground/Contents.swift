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

let maze = [[0,1,0,1],[0,1,0,1],[0,1,0,1],[0,0,0,0]]
print(solution(maze))

/*
 
 불이 다 꺼진 미로가 있다.
 그래서 왼손만 집고 미로를 탈출해야하는데,
 0,0 위치에서 N*N인 미로의 N-1 N-1 에서 탈출해야한다.
 
 0 1 0 1
 0 1 0 1
 0 1 0 1
 0 0 0 0
 
 이렇다고 한다면 왼쪽에서 부터 한칸식 이동하면 총 4칸을 건너서 탈출할 수 있다
 탈출할 수 있는 최소의 횟수를 반환해라
 
 
 */

/*
 
 이렇게 해서 총 4문제를 풀었다,,, 그런데 사실 내가 푼 것이 100 만점일까??? 라는 의구심이 든다.
 모든 문제가 백퍼센트 장담을 할 수가 없어서,,,, 잘 모르겠다.
 많은 사람들이 5문제 까지도 풀었다고 하니,,, 많은 자신이 안 생긴다.
 1번도 내가 실수한 부분이 무조건 있을 것 같다.....
 문제 복사를 하지 못해서,,, 내가 문제를 잘 못 읽었을 수도 있다.
 
 그래도 처음으로 라인 코딩 테스트를 봤고 정말 최선을 다해 봤으니 후회는 없다.
 
 나머지는 문제는 블랙잭과 취업 문제가 나왔는데, 이해하기 어려워서 건드리지 않았다.
 
 */
