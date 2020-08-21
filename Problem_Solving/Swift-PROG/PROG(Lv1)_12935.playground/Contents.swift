import UIKit

func solution(_ arr:[Int]) -> [Int] {
    
    var mostSmall = 987654321
    
    for element in arr {
            
        if element < mostSmall {
            mostSmall = element
        }
        
    }
    
    let answer = arr.filter { (number) -> Bool in
        
        return number == mostSmall ? false : true
    }
    
    print(answer)
    
    return answer.isEmpty == true ? [-1] : answer
}

let arr : [Int] = [4,3,2,1]

solution(arr)
