import UIKit



func solution(_ price : Int, _ money : Int, _ count : Int ) -> Int64{
    var answer : Int64 = 0
    
    var list : [Int64] = []
    
    for cnt in 1...count{
        let num : Int64 = Int64(price * cnt)
        list.append(num)
    }
    
    let sum = list.reduce(0) { (result, element) -> Int64 in
        return result + element
    }
    
    return money > sum ? 0 : sum - Int64(money)
}


print(solution(2500, 0, 2500))
