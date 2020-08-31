import UIKit

func solution2(_ number:String, _ k:Int) -> String {
    
    var returnSize = number.count - k
    let arrayNum = Array(number).map { (char) -> Int in
        return Int(String(char))!
    }
    
    var index = -1
    var numList : [Int] = []
    
    while returnSize > 0 {
        
        var tempIndex = 0
        var maxElement = -1
        
        for search in (index + 1)...(number.count - returnSize){
            
            let searchNum = arrayNum[search]
            
            if maxElement < searchNum {
                maxElement = searchNum
                tempIndex = search
                
                if maxElement == 9 {
                    break
                }
            }
            
        }
        
        index = tempIndex
        numList.append( arrayNum[index] )
        returnSize -= 1
        
    }
    
    let answer : [String] = numList.map { (element) -> String in
        return String(element)
    }
    
    
    return answer.joined()
}


let number = "4177252841"
let k = 9
print(solution(number, k))


func solution(_ number:String, _ k:Int) -> String {
    
    let maxCnt = number.count - k
    let arrayNum = Array(number).map { (char) -> Int in
        return Int(String(char))!
    }
    
    var answerList : [Int] = []
    var k = k
    for (index , element) in arrayNum.enumerated() {
        
        if k != 0 {
        
            var maxRemove = arrayNum.count - index >= maxCnt ? maxCnt : arrayNum.count - index
           
            while maxRemove > 0 && !answerList.isEmpty && answerList.last! < element && k > 0{
                answerList.removeLast()
                k -= 1
                maxRemove -= 1
            }
            
        }
        
        if answerList.count < maxCnt {
                
            answerList.append(element)
            
        }
        
//        print(index , k , answerList)
        
    }
    
    return answerList.map { (element) -> String in
        return String(element)
    }.reduce("", +)
}

