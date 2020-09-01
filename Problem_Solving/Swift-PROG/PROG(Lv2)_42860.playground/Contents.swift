import UIKit

var flag = false

// 1 : 06
func solution(_ name:String) -> Int {
    
    let startString = Array(repeating: "A", count: name.count)
    
    var queue : [( name : [String], location : Int , cnt : Int )] = []
    
    queue.append((name: startString, location: 0, cnt: 0))
    
    while !queue.isEmpty {
        
        var tempName = queue.first!.name
        let location = queue.first!.location
        let cnt = queue.first!.cnt
        
        queue.removeFirst()
        
        if tempName.joined() == name {
            return cnt - 1
        }
        
        let locationChar : Character = Character( tempName[location] )
        let makeChar : Character = name[ name.index(name.startIndex, offsetBy: location) ]
        
        tempName[location] = String(name[ name.index(name.startIndex, offsetBy: location) ])
        
        let moveUP =  Int( makeChar.asciiValue! ) - Int( locationChar.asciiValue! )
        let moveDown : Int = Int( Character("Z").asciiValue! ) - Int( makeChar.asciiValue! ) + 1
        
        let moveCnt = min(moveUP , moveDown)
        
//        print(tempName , locationChar , makeChar , moveCnt , moveUP , moveDown)
        
        if location + 1 >= name.count {
            let forward = (tempName, 0, cnt + moveCnt + 1)
            let backward = (tempName, location - 1, cnt + moveCnt + 1)
            queue.append(forward)
            queue.append(backward)
        }
        else if location - 1 < 0{
           let forward = (tempName, location + 1, cnt + moveCnt + 1)
           let backward = (tempName, name.count - 1, cnt + moveCnt + 1)
            queue.append(forward)
            queue.append(backward)
        }
        else{
           let forward = (tempName, location + 1, cnt + moveCnt + 1)
           let backward = (tempName, location - 1, cnt + moveCnt + 1)
            queue.append(forward)
            queue.append(backward)
        }
        
    }

    return 0
}

let name : String = "JAN"
print(solution(name))


