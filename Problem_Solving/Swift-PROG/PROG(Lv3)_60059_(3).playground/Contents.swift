import UIKit


func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    var board : [[Int]] = Array(repeating: Array(repeating: 0, count: lock.count * 3), count: lock.count * 3)
    var key = key
    
    for yindex in lock.count..<(lock.count * 2){
        
        for xindex in lock.count..<(lock.count * 2){
            
            board[yindex][xindex] = lock[yindex - lock.count][xindex - lock.count]
            
        }
        
    }
    
    if checkISFit(board, lock) {return true}
    
//    for element in board{
//        print(element)
//    }
//
//    print()
    
    let cnt = key.count - 1
    
    for _ in 0..<4{
    
    for y in 1...lock.count + cnt{
    
    for x in 1...lock.count + cnt{
        
        if moveKey(x: x, y : y, board, key, lock) {
           return true
        }
        
    }
    
    }
        
       key = rotateKey(key)
        
    }
    
    return false
}

func moveKey( x : Int, y : Int,_ board : [[Int]],_ key : [[Int]],_ lock : [[Int]]) -> Bool{
    
    var tempBoard = board
    
    let ystart = (lock.count - key.count + y)
    
    let xstart = (lock.count - key.count + x)
    
    var y = 0
    
    for yindex in ystart..<ystart + key.count{
        
        var x = 0
        
        for xindex in xstart..<xstart + key.count{
            
            
            tempBoard[yindex][xindex] += key[y][x]
            
            x += 1
        }
        
        y += 1
        
    }
    
    return checkISFit(tempBoard, lock)
}

func checkISFit(_ board : [[Int]],_ lock :[[Int]]) -> Bool{
    
    for yindex in lock.count..<(lock.count * 2){
        
        for xindex in lock.count..<(lock.count * 2){
            
            if board[yindex][xindex] == 2 || board[yindex][xindex] == 0 {
                
                return false
            }
            
        }
        
    }
    
    return true
    
}

func rotateKey(_ key : [[Int]]) -> [[Int]]{
    
    let keysize = key.count - 1
    var tempKey : [[Int]] = Array(repeating: Array(repeating: 0, count: key.count), count: key.count)
    
    for yindex in 0..<key.count{
        
        for xindex in 0..<key.count{
            
            tempKey[xindex][keysize - yindex] = key[yindex][xindex]
            
        }
        
    }
    
//    for element in tempKey{
//        print(element)
//    }
//
//    print()

    return tempKey
}


let key : [[Int]] = [[1,1,1],[1,1,1],[1,1,1]]
let loct : [[Int]] = [[1,1,1], [1,0,1], [1, 1, 1]]


print(solution(key, loct))

