import UIKit


var KeyPad : [[String]] = Array(repeating: Array(repeating: "*", count: 3), count: 4)
var tempPad : [[String]] = Array(repeating: Array(repeating: "*", count: 3), count: 4)

var cnt : Int = Int.max

let RL = [1,-1,0,0]
let UD = [0,0,1,-1]

var answer : String = ""

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    KeyPad[3][0] = "L"
    KeyPad[3][2] = "R"
    
    for element in numbers{

        switch element {
        case 1 , 4 , 7:
            answer += "L"
            move(element, finger: "L")
        case 3 , 6 , 9 :
            answer += "R"
            move(element, finger: "R")
        default:
            moreClose(element, hand)
        }

    }
        
    return answer
}

func moreClose(_ element : Int ,_ hand : String){
    
    var left : Int
    var right: Int
    
    switch element {
    case 2:
        DFS(0, findFinger("L")!.x, findFinger("L")!.y, 1, 0)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        left = cnt; cnt = Int.max
        DFS(0, findFinger("R")!.x, findFinger("R")!.y, 1, 0)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        right = cnt; cnt = Int.max
        
        if left < right {
            answer += "L"
            move(element,finger:  "L")
        }
        else if left == right {
            
            if hand == "left"{
                answer += "L"
                move(element,finger:  "L")
            }
            else{
                answer += "R"
                move(element,finger:  "R")
            }
            
        }
        else {
            answer += "R"
            move(element,finger:  "R")
        }
        
    case 5:
        DFS(0, findFinger("L")!.x, findFinger("L")!.y, 1, 1)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        left = cnt; cnt = Int.max
        DFS(0, findFinger("R")!.x, findFinger("R")!.y, 1, 1)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        right = cnt; cnt = Int.max
        
        if left < right {
            answer += "L"
            move(element,finger:  "L")
        }
        else if left == right {
            
            if hand == "left"{
                answer += "L"
                move(element,finger:  "L")
            }
            else{
                answer += "R"
                move(element,finger:  "R")
            }
            
        }
        else {
            answer += "R"
            move(element,finger:  "R")
        }
        
        
    case 8:
        DFS(0, findFinger("L")!.x, findFinger("L")!.y, 1, 2)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        left = cnt; cnt = Int.max
        DFS(0, findFinger("R")!.x, findFinger("R")!.y, 1, 2)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        right = cnt; cnt = Int.max
        
        if left < right {
            answer += "L"
            move(element,finger:  "L")
        }
        else if left == right {
            
            if hand == "left"{
                answer += "L"
                move(element,finger:  "L")
            }
            else{
                answer += "R"
                move(element,finger:  "R")
            }
            
        }
        else {
            answer += "R"
            move(element,finger:  "R")
        }
        
    case 0:
        DFS(0, findFinger("L")!.x, findFinger("L")!.y, 1, 3)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        left = cnt; cnt = Int.max
        DFS(0, findFinger("R")!.x, findFinger("R")!.y, 1, 3)
        tempPad = Array(repeating: Array(repeating: "*", count: 3), count: 4)
        right = cnt; cnt = Int.max
        print(left, right)
        if left < right {
            answer += "L"
            move(element,finger:  "L")
        }
        else if left == right {
            
            if hand == "left"{
                answer += "L"
                move(element,finger:  "L")
            }
            else{
                answer += "R"
                move(element,finger:  "R")
            }
            
        }
        else {
            answer += "R"
            move(element,finger:  "R")
        }
    default:
        break
    }
    
    
}

func DFS(_ temp : Int ,_ currentX : Int ,_ currentY : Int ,_ endX : Int ,_ endY : Int){
    
    tempPad[currentY][currentX] = "#"
    
    if currentX == endX && currentY == endY{
        
        if cnt > temp {
            cnt = temp
        }
        
    }
    else{
        
        for move in 0...3{
            
            let nextX = currentX + RL[move]
            let nextY = currentY + UD[move]
            
            if nextX >= 0 && nextX < 3 && nextY >= 0 && nextY < 4 {
                
                if tempPad[nextY][nextX] != "#" {
                    DFS(temp + 1, nextX, nextY, endX, endY)
                    tempPad[nextY][nextX] = "*"
                }
                
            }
            
        }
        
    }
    
}

func move(_ element : Int , finger : String){
    
    let location = findFinger(finger)
    KeyPad[location!.y][location!.x] = "*"
    switch element {
    case 1:
        KeyPad[0][0] = "L"
    case 4:
        KeyPad[1][0] = "L"
    case 7:
        KeyPad[2][0] = "L"
    case 3:
        KeyPad[0][2] = "R"
    case 6:
        KeyPad[1][2] = "R"
    case 9:
        KeyPad[2][2] = "R"
        
    case 2:
        KeyPad[0][1] = finger
    case 5:
         KeyPad[1][1] = finger
    case 8:
          KeyPad[2][1] = finger
    case 0:
          KeyPad[3][1] = finger
    default:
        break
    }

}

func findFinger(_ finger : String) -> (y :Int, x :Int)?{
    
    for Y in 0..<KeyPad.count{
        for X in 0..<KeyPad[Y].count{
            
            if KeyPad[Y][X] == finger{
                return (Y,X)
            }
            
        }
    }
    
    return nil
}

let numbers : [Int] = [7, 0, 8, 2, 8, 3, 1, 5, 7, 6, 2]
let hand : String = "left"

print(solution(numbers, hand))
