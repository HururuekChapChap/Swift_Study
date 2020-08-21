import UIKit

func climbStairs(_ n: Int) -> Int {
        
    var start : Int = 3
    var array : [Int] = [1,2]
    
    while ( start <= n ){
        
        let total = array[0] + array[1]
        
        array = swap(array: array, new: total)
        
        start += 1
    }
    
    if n == 1 {
        return 1
    }
    
    return array[1]
}

func swap(array : [Int], new : Int ) -> [Int] {
    
    var newArray = array
    
    let temp = newArray[1]
    newArray[1] = new
    newArray[0] = temp
    
    return newArray
}

print(climbStairs(45))
