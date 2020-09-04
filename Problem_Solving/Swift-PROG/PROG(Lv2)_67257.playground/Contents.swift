import UIKit

var list : [[String]] = []

func solution(_ expression:String) -> Int64 {
    
    var answer : Int64 = 0
    
    let getFunction = expression.filter { (char) -> Bool in
        return !char.isNumber
    }.map { (char) -> String in
        return String(char)
    }
    
    let getNumber = expression.components(separatedBy: ["-","*","+"])
    
    let makeSetArray = Array(Set(getFunction))
    
    
    
    var funcAndNum : [String] = [getNumber[0]]
    
    for (index , element ) in getFunction.enumerated() {
        
        funcAndNum.append(element)
        funcAndNum.append(getNumber[index + 1])
        
    }
    
    permutaion(makeSetArray, 0, [] , makeSetArray.count)
    
    for element in list {
        var calculate = false
        var tempStack : [String] = []
        var tempFuncAndNum = funcAndNum
        
        for item in element {
            
            
            for single in tempFuncAndNum {
                
                
                if single != "+" && single != "-" && single != "*"{
                
                    if calculate {
                        //작업해줘야한다.
                        
                        var newNumber : Int64 = 0
                        let popLastNum  = tempStack.removeLast()
                        
                        switch item {
                        case "+":
                            newNumber = Int64(popLastNum)! + Int64(single)!
                        case "-":
                            newNumber = Int64(popLastNum)! - Int64(single)!
                        default:
                            newNumber = Int64(popLastNum)! * Int64(single)!
                        }
                        
                        tempStack.append(String(newNumber))
                        
                        calculate = false
                    }
                    else{
                        tempStack.append(single)
                    }
                    
                }
                else{
         
                    
                    if single == item {
                       
                        calculate = true
                    }
                    else{
                        tempStack.append(single)
                    }
                    
                    
                }
            
                
            }
            
              tempFuncAndNum = tempStack
            tempStack = []
            
        }
        
        //숫자 계산
        answer = max(answer , abs(Int64(tempFuncAndNum.first!)!) )
        
    }
    
    
    return answer
}

func permutaion(_ array : [String],_ current : Int, _ sum : [String] , _ total : Int){
    
    var temp = array
    var tempSum = sum
    
    if current  == total {
        
        list.append(tempSum)
    }
    else{
        
        for index in 0..<array.count {
            
            let item = array[index]
            temp.remove(at: index)
            tempSum.append(item)
            permutaion(temp, current + 1 ,tempSum ,total)
            temp.insert(item, at: index)
            tempSum = sum
            
        }
        
    }
    
}

let expression = "50*6-3*2"

print(solution(expression))

