import Foundation

func solution(_ n:Int) -> [Int] {
    
    
    if n == 1 {
        return [1]
    }
    
    var total = 1
    
    for plus in 2...n{
        
        total = total + plus
        
    }
    
    var map : [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    var number = 1
    var y = 0
    var x = 0
    var whatTodo = "D"
    
    var lastBottom = n - 1
    var firstTop = 0
    
    while number <= total {
        
        if whatTodo == "D"{
            
            map[y][x] = number
            
            if lastBottom == y {
                
                x += 1
                whatTodo = "R"
                lastBottom -= 1
                
            }
            else{
                y += 1
            }
            
        }
        else if whatTodo == "R"{
            
            map[y][x] = number
            
            if x + 1 == n || map[y][x + 1] != 0 {
                whatTodo = "T"
                y -= 1
                x -= 1
            }
            else{
                x += 1
            }
            
        }
        else if whatTodo == "T"{
            map[y][x] = number
            
            if y - 1 == firstTop {
                firstTop = y + 1
                whatTodo = "D"
                y += 1
            }
            else{
                y -= 1
                x -= 1
            }
        }
        
        number += 1
        
    }
    
    return map.flatMap { (ele) -> [Int] in
        return ele
    }.filter({$0 != 0})
}


let n = 6

print(solution(n))
