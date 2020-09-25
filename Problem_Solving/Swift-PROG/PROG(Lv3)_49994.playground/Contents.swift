import UIKit


func solution(_ dirs:String) -> Int {
    
    //Y : [X]
    var dict : [Int : [Int : [String] ] ] = [:]
    
    var currentX : Int = 0
    var currentY : Int = 0
    
    let dirsArray = Array(dirs).map{String($0)}
    
    var answer = 0
    
    for char in dirsArray {
        
        
        var nextX = currentX
        var nextY = currentY
        var nextChar = ""
        
        switch char {
            
        case "U":
            
            nextY = currentY + 1
            nextChar = "D"
            
        case "D":
    
            nextY = currentY - 1
            nextChar = "U"
            
        case "L":
            
            nextX = currentX - 1
            nextChar = "R"
            
        default:
            
            nextX = currentX + 1
            nextChar = "L"
        }
        
        print(currentY , currentX)
        print(nextY , nextX , answer)
        print()
        
        if !(-5...5).contains(nextY) || !(-5...5).contains(nextX) {
            continue
        }
        
        var currentFlag = false
        var nextFlag = false
        
        if let exist = dict[currentY] {
            
            if let list = exist[currentX] {
                
                if !list.contains(char) {
                    dict[currentY]![currentX]?.append(char)
                    currentFlag = true
                }
                
            }
            else{
                dict[currentY]![currentX] = [char]
                currentFlag = true
            }
            
        }
        else{
            dict[currentY] = [currentX : [char]]
            currentFlag = true
        }
        
        if let exist = dict[nextY] {
            
            if let list = exist[nextX] {
                
                if !list.contains(nextChar) {
                    dict[nextY]![nextX]?.append(nextChar)
                    nextFlag = true
                }
                
            }
            else{
                dict[nextY]![nextX] = [nextChar]
                nextFlag = true
            }
            
        }
        else{
            dict[nextY] = [nextX : [nextChar]]
            nextFlag = true
        }
        
        
        if nextFlag && currentFlag {
            answer += 1
        }
        
        
        currentY = nextY
        currentX = nextX
        
    }
    
    return answer
}


let dirs = "LDRDLUURL"

//print(solution(dirs))

var dict : [Int : [Int : Int]] = [:]

dict[1] = [2:3,3:4]

print(dict[1]!)

print(dict[1]![2]!)

dict[1]![4] = 5

print(dict[1]!)










