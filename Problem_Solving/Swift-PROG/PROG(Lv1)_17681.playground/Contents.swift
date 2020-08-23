import UIKit

func solution2(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    let binaryArr1 = arr1.map { (number) -> String in
        
        let returnString = makeString(number: number , n)
        
        return returnString
    }
    
    let binaryArr2 = arr2.map { (number) -> String in
        
        let returnString = makeString(number: number, n)
            
        return returnString
    }
    
    
    for index in 0..<n{
        
        var returnValue : String = ""
        
        let tempOne = binaryArr1[index].map { (element) -> String in
            return String(element)
        }
        let tempTwo = binaryArr2[index].map { (element) -> String in
            return String(element)
        }
        
        for elementIndex in 0..<n{
            
            if tempOne[elementIndex] == tempTwo[elementIndex] {
                returnValue += tempOne[elementIndex]
            }
            else{
                returnValue += "#"
            }
            
        }
        
        answer.append(returnValue)
        
    }
    
    
    return answer
}

func makeString(number : Int,_ n : Int) -> String{
    
    var tempNumber = number
    var returnString = ""
    
    while tempNumber > 0 {
        
        if tempNumber % 2 == 0 {
            returnString.insert(" ", at: returnString.startIndex)
        }
        else{
            returnString.insert("#", at: returnString.startIndex)
        }
        
        tempNumber /= 2
        
    }
    
    for cnt in 0..<n{
        if number < Int(pow(2, Double(cnt))) {
            returnString.insert(" ", at: returnString.startIndex)
        }
    }
    
    return returnString
    
}

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []

    for i in 0..<n {
        var bitwise = String(arr1[i] | arr2[i], radix: 2)
        bitwise = String(repeating: "0", count: n-bitwise.count) + bitwise
        answer += [bitwise.reduce("", { $0 + ($1 == "1" ? "#" : " ") })]
    }

    return answer
}

let n : Int = 5
let arr1 : [Int] = [9, 20, 28, 18, 11]
let arr2 : [Int] = [30, 1, 21, 17, 28]
//print(solution(n, arr1, arr2))

let fisrt : [Int] = [1,2,5,2,24]
let last : [Int] = [1,23,5,3,67]
