import UIKit

let arr : [Int] = [2, 36, 1, 3]
let divisor : Int = 1

func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
    
    let filter = arr.filter { (item) -> Bool in
        if item % divisor == 0 {
            return true
        }
        
        return false
    }
    
    if filter.isEmpty {
        return [-1]
    }
    
    return  filter.sorted()
}

solution(arr, divisor)
