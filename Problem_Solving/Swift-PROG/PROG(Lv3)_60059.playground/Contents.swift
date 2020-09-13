import UIKit

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    
    var total = 0
    
    for yelement in lock{
        for xelement in yelement{
            
            if xelement == 0 {
                total += 1
            }
            
        }
    }
    
    var tRight = Array(repeating: Array(repeating: 0, count: lock.count), count: lock.count)
    var bLeft = Array(repeating: Array(repeating: 0, count: lock.count), count: lock.count)
    var bRight = Array(repeating: Array(repeating: 0, count: lock.count), count: lock.count)
    
    //tRight
    for (yindex, yElement) in lock.enumerated(){
        for (xindex, xElement) in yElement.enumerated() {
            
            if xElement == 1 {
                tRight[yindex][lock.count - 1 - xindex] = 1
            }
            
        }
    }
    
    //bLeft
    for (yindex, yElement) in lock.enumerated(){
        for (xindex, xElement) in yElement.enumerated() {
            
            if xElement == 1 {
                bLeft[lock.count - 1 - yindex][xindex] = 1
            }
            
        }
    }
    
    //bRight
    for (yindex, yElement) in lock.enumerated(){
        for (xindex, xElement) in yElement.enumerated() {
            
            if xElement == 1 {
                bRight[lock.count - 1 - yindex][lock.count - 1 - xindex] = 1
            }
            
        }
    }
    
       for eleemnt in tRight{
           print(eleemnt)
       }
    
       print()
       for eleemnt in bRight{
            print(eleemnt)
        }
       
       print()
       for eleemnt in bLeft{
            print(eleemnt)
        }
       
    
    
    
    for (yindex , yElement) in lock.enumerated(){
        
        for (xindex, _) in yElement.enumerated(){
            
            if checkisRight(xindex, yindex, key, tRight, total) {
                return true
            }
            
        }
        
    }
    
    for (yindex , yElement) in tRight.enumerated(){
        
        for (xindex, _) in yElement.enumerated(){
            
            if checkisRight(xindex, yindex, key, tRight, total) {
                return true
            }
            
        }
        
    }
    
    for (yindex ,yElement) in bRight.enumerated(){
           
           for (xindex, _) in yElement.enumerated(){
               
               if checkisRight(xindex, yindex, key, tRight, total) {
                   return true
               }
               
           }
           
       }
    
    for (yindex ,yElement) in bLeft.enumerated(){
           
           for (xindex, _) in yElement.enumerated(){
               
               if checkisRight(xindex, yindex, key, tRight, total) {
                   return true
               }
               
           }
           
       }
    
    
    return false
}

func checkisRight(_ x : Int , _ y : Int, _ key : [[Int]], _ lock : [[Int]],_ total : Int) -> Bool {
    
    var cnt = 0
    
    for ystart in y..<y + key.count {
        for xstart in x..<x + key.count{
            
            if key[ystart - y][xstart - x] == 1 && lock[ystart][xstart] == 0 {
               cnt += 1
                
                if total == cnt {
                    return true
                }
                
            }
            
        }
    }
    
    return false
}

let key = [[0, 0, 1], [1, 0, 0], [0, 1, 1]]
let lock = [[1, 1, 1], [1, 1, 0], [1, 0, 1]]

print(solution(key, lock))
