import UIKit

var map : [[String]] = []

func solution(_ drum : [String]) -> Int{

    var answer = 0
    for element in drum {
        
        map.append(element.map({ (char) -> String in
            return String(char)
        }))
        
    }
    
    for start in 0..<drum[0].count {
        
        if isCanPass(start, map.count) {
            answer += 1
        }
        
    }
    
    
    
    return answer
}

func isCanPass(_ x : Int ,_ height : Int) -> Bool {
    
    var current_y = 0
    var current_x = x
    var cntStar = 0
    
    while current_y < height {
        
        let char = map[current_y][current_x]
        
        
        switch char {
        case "#":
            current_y += 1
        case ">":
            current_x += 1
        case "<":
            current_x -= 1
        case "*":
            
            cntStar += 1
            
            if cntStar == 1{
                current_y += 1
            }
            
        default:
            print("Nothing happen")
        }
        
        if cntStar == 2 {
            return false
        }
        
    }
    
    return true
    
}

let drum : [String] = ["******", "******"]

print(solution(drum))
