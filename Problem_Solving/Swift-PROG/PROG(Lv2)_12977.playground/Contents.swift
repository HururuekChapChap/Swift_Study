import UIKit

var answer = 0

func solution(_ nums:[Int]) -> Int {
    


    combination(nums, 0, 3, 0, 0)
    
    return answer
}

func combination(_ arr : [Int],_ current : Int ,_ max : Int ,_ index : Int ,_ sum : Int ){
    
    var temp = arr
    
    if current == max {
        
        if isPrime(sum){
            answer += 1
        }
        
    }
    else{
        
        for start in index..<arr.count {
            
            let item = temp[start]
            temp.remove(at: start)
            combination(arr, current + 1, max, start + 1, sum + item)
            temp.insert(item, at: start)
            
        }
        
    }
    
}

func isPrime(_ number : Int) -> Bool{
    
    for num in 2...Int(sqrt(Double(number))) {
            
        if number % num == 0 {
            return false
        }
        
    }
    
    return true
}


let nums = [1,2,7,6,4,5]
print(solution(nums))

