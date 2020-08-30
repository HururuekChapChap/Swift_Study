import UIKit

var check : [[(check : Int, cnt : Int)]] = []
var golbalcnt = 0
var golbalMax = 0

let UD : [Int] = [1,-1,0,0]
let LR : [Int] = [0,0,1,-1]



func solution(_ map : [[Int]], _ maxNum : Int){

    for y in 0..<map.count{

        for x in 0..<map[y].count{
            check = Array(repeating: Array(repeating: (0,-1), count: map.count), count: map.count)
            check[y][x] = (1,0)
            golbalcnt = 1
            DFS(x, y, maxNum, 0, map.count)
            golbalMax = max(golbalMax, golbalcnt)
        }

//        print(check[y])

    }
    
print(golbalMax)
}

func DFS(_ x : Int , _ y : Int, _ max : Int , _ cnt : Int, _ range : Int){
    
    if cnt < max {
        
        
        for times in 0..<4{
            
            let nextX = x + LR[times]
            let nextY = y + UD[times]
        
           
            if nextX >= 0 && nextX < range && nextY >= 0 && nextY < range {
                    
                if map[nextY][nextX] == 0{
                    
                    if check[nextY][nextX].check == 0{
                        golbalcnt += 1
                        check[nextY][nextX] = (1,cnt+1)
                        DFS(nextX, nextY, max, cnt + 1, range)
                        
                    }
                    else if check[nextY][nextX].check == 1 && cnt + 1 < check[nextY][nextX].cnt  {
                        check[nextY][nextX] = (1,cnt+1)
                        DFS(nextX, nextY, max, cnt + 1, range)
                    }
                    
                }
                
            }
            
        }
        
    }
    
}
    

let string = "6 2".components(separatedBy: " ")
var map : [[Int]] = [[0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 1, 0], [0, 0, 0, 0, 0, 0], [0, 0, 1, 0, 0, 0], [0, 0, 0, 0, 0, 0]]


solution(map, Int(string[1])!)
    
    

