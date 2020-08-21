import UIKit


let N = 3

var map :[[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)

let UD = [0,0,-1,1]
let LR = [1,-1,0,0]

func DFS(x : Int, y : Int){
    
    map[y][x] = 1
    //print("\(x) \(y)")
    
    if(x == N - 1 && y == N - 1){
        for i in 0..<N{
            
            for j in 0..<N{
                
                print(map[i][j] , terminator : "")
                
            }
            print("")
            
        }
        
        print("")
    }
    else{
        
        for i in 0..<4{
            
            let nextX = x + LR[i]
            let nextY = y + UD[i]
            
            if nextX >= 0 && nextX < N && nextY >= 0 && nextY < N {
                
                if map[nextY][nextX] == 0 {
                    DFS(x: nextX, y: nextY)
    
                }
                
            }
            
        }
        
    }
    
    map[y][x] = 0
    
}

DFS(x: 0, y: 0)

