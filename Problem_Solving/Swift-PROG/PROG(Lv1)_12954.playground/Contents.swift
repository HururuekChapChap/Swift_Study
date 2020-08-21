import UIKit

func solution(_ x:Int, _ n:Int) -> [Int64] {
    
    return Array(1...n).map { (element) -> Int64 in
        return Int64(element * x)
    }
    
}

solution(-4, 2)


let a = 5
let b = 3

let array = Array(repeating : Array(repeating : "*" , count : a), count : b)

var answer = ""

for index in 0..<array.count{
    
    answer += array[index].joined() + "\n"
    
}

print(answer)
