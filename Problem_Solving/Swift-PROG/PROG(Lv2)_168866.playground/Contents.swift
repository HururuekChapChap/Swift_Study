import UIKit

var map : [Bool] = []
var answerList : [Int] = []
func solution2(_ number:String, _ k:Int) -> String {
    
    let splitNumber = Array(number).map { (char) -> String in
        return String(char)
    }
    
    map = Array(repeating: true, count: splitNumber.count)
    
    combination(0, 0, number.count - k, splitNumber, "")
    
    return String(answerList.max()!)
}

func combination(_ cnt : Int , _ index : Int ,_ total : Int,_ splitNumber : [String], _ returnString : String){
    
    if cnt == total {
        
        let number = Int(returnString)!
        answerList.append(number)
        
    }
    else{
        
        for current in index..<splitNumber.count {
            
            if map[current] == true {
                map[current] = false
                combination(cnt + 1, current + 1, total, splitNumber, returnString + splitNumber[current])
                map[current] = true
            }
            
        }
        
    }
    
}

//1000000 자리 까지 가능
let number : String = "4177252841"
let k : Int = 4

print(solution(number, k))

func solution(_ number:String, _ k:Int) -> String {

    
    
    return ""
}
