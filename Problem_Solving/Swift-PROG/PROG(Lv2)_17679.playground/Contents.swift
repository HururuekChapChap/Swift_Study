import UIKit


// 1 : 22
var check : [[Bool]] = []
var breakBlock : Int = 0

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var map : [[String]] = []
    
    for element in board {
        let temp = element.map { (char) -> String in
            return String(char)
        }
        map.append(temp)
    }
    
    
    var flag = true
    
    while flag == true {
        
    flag = false
        
    check = Array(repeating: Array(repeating: true , count: n), count: m)
    
    for y in 0..<m{
        
        for x in 0..<n {
                
            if checkIs4(map, x, y) {
                flag = true
            }
            
        }
        
    }
    
    moveItme(&map)
    
    for element in map{
        print(element)
    }
        print(flag)
        
        
    }
    
    
    return breakBlock
}

func checkIs4(_ map : [[String]],_ x : Int, _ y: Int) -> Bool{
    
    let start = map[y][x]
    
    let LR = [1,1,0,0]
    let UD = [1,0,1,0]
    
    if start != " " {
    
    if x >= 0 && x < map[0].count - 1 && y >= 0 && y < map.count - 1{
        
        if map[y + 1][x + 1] == start && map[y][x + 1] == start && map[y + 1][x] == start {
            
            for go in 0..<4{
                
                if check[y + UD[go]][x + LR[go]] == true {
                    breakBlock += 1
                }
                check[y + UD[go]][x + LR[go]] = false
            }
            
            return true
        }
        
    }
        
    }
    
    return false
}

func moveItme(_ map : inout [[String]]){
    
    for x in 0..<map[0].count {
        
        var down = map.count - 1
        var cnt = 0
        
        while down >= 0 {
            
            if !check[down][x]{
                cnt += 1
            }
            else if check[down][x] && cnt > 0 {
                
                let item = map[down][x]
                map[down + cnt][x] = item
                check[down + cnt][x] = true

                for start in down..<(down+cnt) {
                    check[start][x] = false
                    map[start][x] = " "
                }
                
            }
            
            down -= 1
            
        }

        for start in 0..<cnt {
//            print(start, x)
            check[start][x] = false
            map[start][x] = " "
        }
        
        
        
    }
    
}


let m = 2
let n = 2
var board = ["AA", "AA"]

print(solution(m, n, board))


