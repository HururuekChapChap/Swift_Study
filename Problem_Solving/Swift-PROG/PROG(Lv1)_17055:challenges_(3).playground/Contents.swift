import UIKit

var map : [[(time : Int,tip : Int)]] = []
var cash : [[Bool]] = []
let UD = [1,-1,0,0]
let LR = [0,0,1,-1]
var maxCash = 0

func solution(_ r:Int,_ delivery:[[Int]]) -> Int {
        
    var inputList : [(Int, Int)] = []
    var cnt = 0

    cash = Array(repeating: Array(repeating: true, count: r), count: r)
    
    for index in 0...delivery.count {
        
        if index != 0 && index % 3 == 0 {
            map.append(inputList)
            cnt += 1
            inputList.removeAll()
        }
        
        if index == delivery.count {
            break
        }
        
        let time = delivery[index][0]
        let money = delivery[index][1]
        
        inputList.append((time, money))
        
    }
    
    let startTip = map[0][0].tip
    map[0][0].tip = 0
    DFS(0,0,0,startTip, r)
    
    print(maxCash)
    
    return 0
}

func DFS(_ x : Int , _ y : Int,_ time : Int , _ sum : Int , _ end : Int){

    if time < 16{
        print(x , y , time )
        isEnd(time)
        for index in 0..<4{
            
            let nextX = x + LR[index]
            let nextY = y + UD[index]
            
            if nextX >= 0 && nextX < end && nextY >= 0 && nextY < end{
                
                let tip = map[nextY][nextX].tip
                
                if cash[nextY][nextX] && tip > 0{
                    map[nextY][nextX].tip = 0
                    DFS(nextX, nextY, time + 1, tip + sum, end)
                    map[nextY][nextX].tip = tip
                }
                else{
                    DFS(nextX, nextY, time + 1,sum, end)
                }

            }
            
        }
        
    }

    
}

func isEnd(_ time : Int){
    
    var flag = false
    
    for y in 0..<map.count{
        
        for x in 0..<map[y].count{
            
            if time > map[y][x].time {
                cash[y][x] = false
            }
            else{
                cash[y][x] = true
            }
            
        }
    }

}

let r : Int = 3
let delivery : [[Int]] = [[1,10],[8, 1],[8, 1],[3, 100],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[9, 100],[8, 1],[8, 1],[8, 1]]

solution(r, delivery)
