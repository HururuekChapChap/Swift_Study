import UIKit

let word = "2*3+4*5-80"

let list = ["+","-","*"]
var tempVisited = [0,0,0]
var tempPushList : [Int] = []
var permutatioinList : [[String]] = []


func Permutation(current : Int ,visited : inout [Int], pushList : inout [Int] ){
    
    if current == 3 {
        permutatioinList.append([])
        for item in pushList {
            permutatioinList[permutatioinList.count - 1].append(list[item])
        }
        
        
    }
    else{
        
        for i in 0..<3{
        
            if visited[i] == 0 {
            
                visited[i] = 1
                pushList.append(i)
                Permutation(current: current + 1, visited: &visited, pushList: &pushList)
                pushList.remove(at: current)
                visited[i] = 0
            }
        }
        
    }
    
}

Permutation(current: 0, visited: &tempVisited, pushList: &tempPushList)

print(permutatioinList)

func operation(_ num1 : Int, _ num2 : Int,_ oper : String) -> Int{
    
    if oper == "+"{
        return num1 + num2
    }
    else if oper == "*"{
        return num1 * num2
    }
    else if oper == "-"{
        return num1 - num2
    }
    
    return 0
}

var MAX = 0

for element in permutatioinList {
    
    let tempWord = word
    var priority = 0
    let singleTempWord = tempWord.map { (char) -> String in
        return String(char)
    }
    
    var singleNumber :String = ""
    var singleWord : [String] = []
    
    for index in 0..<singleTempWord.count {
        
        if (Int(singleTempWord[index]) != nil) {
            
            singleNumber += singleTempWord[index]
            
        }
        else{
            singleWord.append(singleNumber)
            singleNumber = ""
            singleWord.append(singleTempWord[index])
        }
        
        if index == singleTempWord.count - 1 {
            singleWord.append(singleNumber)
        }
        
    }
    
    print(singleWord)
    
    var stackList : [String] = []
    
    print("\(element) 시작 : ")
    
    while singleWord.count != 1 {
        
        var index = 0
        
        while (index < singleWord.count){
            
             print(index , terminator : " ")
            
            if singleWord[index] == element[priority] {
                           
                let beforeNum = stackList[stackList.count - 1]
                stackList.remove(at: stackList.count - 1)
                           
                let number = operation(Int(beforeNum)! , Int(singleWord[index + 1])!, singleWord[index])
                           
                stackList.append(String(number))
                index += 1
                       }
             else{
                    stackList.append(singleWord[index])
                 }
            
            index += 1
            
        }
        
        priority += 1
        singleWord = stackList
        stackList = []
        print(singleWord)
    }
    
    let tempNum = Int(singleWord[0])!.magnitude
    
    if tempNum > MAX {
        MAX = Int(tempNum)
    }
    
    print("=======================================================")
    
    
}



print(MAX)
