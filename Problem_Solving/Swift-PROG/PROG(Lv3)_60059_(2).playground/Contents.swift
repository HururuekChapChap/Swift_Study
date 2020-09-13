import UIKit

struct MeetPoint{
    
    let xfrom : Int
    let yfrom : Int
    
    let xto : Int
    let yto : Int
    
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    var tempKey = key

    
    var total = 0
    
    for yindex in lock{
        for xindex in yindex{
            
            if xindex == 0 {
                total += 1
            }
            
        }
    }
    
    for element in key{
        print(element)
    }

    print()

    for eleement in lock{
        print(eleement)
    }

    print()
    
    var rotateCnt = 0
    
    while rotateCnt < 4 {
    var yCnt = 0
    var yfrom = key.count
    var yto = key.count - 1
    
    var boardYFrom = 0
    var boardYTo = -1
    
    while yCnt < key.count * 2 - 1 {
        
        if yCnt >= key.count {
            yto -= 1
            boardYFrom += 1
        }
        else{
            yfrom -= 1
            boardYTo += 1
        }
        
        var xCnt = 0
        var xfrom = key.count
        var xto = key.count - 1
        var boardXFrom = 0
        var boardXTo = -1
        
        while xCnt < key.count * 2 - 1{
            
            if xCnt >= key.count {
                xto -= 1
                boardXFrom += 1
            }
            else{
                xfrom -= 1
                boardXTo += 1
            }
            
            let keyPoint = MeetPoint(xfrom: xfrom, yfrom: yfrom, xto: xto, yto: yto)
            let boardPoint = MeetPoint(xfrom: boardXFrom , yfrom: boardYFrom, xto: boardXTo, yto: boardYTo)
            
            if checkIs(tempKey, lock , boardPoint , keyPoint , total) {
                return true
            }
            
            xCnt += 1
        }
        
        yCnt += 1
    }
    
    tempKey = rotateKey(tempKey)
        
        for element in tempKey{
            print(element)
        }
    
        rotateCnt += 1
    }
    
    
    return false
}


func checkIs(_ key : [[Int]] , _ extensionLock : [[Int]],_ extensionPoint : MeetPoint,_ keyPoint : MeetPoint ,_ total : Int) -> Bool {
    
    var keyPointStack : [[Int]] = []
    var extensionPointStack : [[Int]] = []
    
//    print(keyPoint)
    
    for yindex in keyPoint.yfrom...keyPoint.yto{
        
        keyPointStack.append(Array(key[yindex][keyPoint.xfrom...keyPoint.xto]))
        
    }
    
//    for element in keyPointStack{
//        print(element)
//    }
//
//    print()
//
//    print(extensionPoint)
//
    for yindex in extensionPoint.yfrom...extensionPoint.yto{
        extensionPointStack.append(Array(extensionLock[yindex][extensionPoint.xfrom...extensionPoint.xto]))
    }
    
//    for element in extensionPointStack{
//        print(element)
//    }
    
    var temp = total
    
    for yindex in 0..<keyPointStack.count{
        
        for xindex in 0..<keyPointStack[yindex].count{
            
            if extensionPointStack[yindex][xindex] == 0 && keyPointStack[yindex][xindex] == 1 {
                temp -= 1
            }
            
        }
        
    }
    
    return temp == 0 ? true : false
}

func rotateKey(_ key : [[Int]]) -> [[Int]]{
    
    var temp = Array(repeating: Array(repeating: 0, count: key.count), count: key.count)
    
    for yindex in 0..<key.count{
        
        for xindex in 0..<key.count{
            
            temp[yindex][xindex] = key[key.count - xindex - 1][yindex]
        }
        
    }
    
    return temp
}

let key = [[0, 0, 1], [0, 0, 0], [0, 1, 1]]
let lock = [[1, 1, 1], [1, 1, 1], [1, 1, 1], [1, 0 ,0]]

print(solution(key, lock))
