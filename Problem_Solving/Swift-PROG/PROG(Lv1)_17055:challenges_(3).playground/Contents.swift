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
    
    for index in 0..<delivery.count {
        
        if index != 0 && index % r == 0 {
            map.append(inputList)
            cnt += 1
            inputList.removeAll()
        }
        
        let time = delivery[index][0]
        let money = delivery[index][1]
        
        inputList.append((time, money))
        
    }
    
     map.append(inputList)
    
    
    
    print(map)
    print(cash)
    
    let tip = map[0][0].tip
    map[0][0].tip = 0
    DFS(0, 0, tip, 0, -1, r)
    
    return 0
}

func DFS(_ x : Int , _ y : Int ,_ sum : Int, _ time : Int ,_ before : Int,_ end : Int){
    
    print(x , y, time , sum )
    
    if isEnd(time){
    
        var cango : Int = -1
        
        if before == 0 {
            cango = 1
        }
        else if before == 1 {
            cango = 0
        }
        else if before == 2 {
            cango = 3
        }
        else if before == 3 {
            cango = 2
        }
        
    for index in 0..<4{
        
        let nextX = x + LR[index]
        let nextY = y + UD[index]
        
        if nextX >= 0 && nextX < end && nextY >= 0 && nextY < end {
            
            if index != cango {
                
                let tip =  map[nextY][nextX].tip
                
                if cash[nextY][nextY] && tip > 0 {
                     map[nextY][nextX].tip = 0
                     DFS(nextX, nextY, sum + tip,time + 1 ,index, end)
                     map[nextY][nextX].tip = tip
                }
                else{
                    DFS(nextX, nextY, sum,time + 1 ,index, end)
                }
                
            }
            
        }
        
    }
        
    }
    
}

func isEnd(_ time : Int) -> Bool{
    
    var flag = false
    
    for y in 0..<map.count{

        for x in 0..<map[y].count{
            
            if map[y][x].time > time {
                cash[y][x] = true
                flag = true
            }
            else{
                cash[y][x] = false
            }
            
        }
    }
    
    return flag
    
}


let r : Int = 4
let delivery : [[Int]] = [[1,10],[8, 1],[8, 1],[3, 100],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[8, 1],[9, 100],[8, 1],[8, 1],[8, 1]]

solution(r, delivery)
