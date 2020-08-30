import UIKit

var check : [Bool] = []
var answer : Int = 0
var dictionary : [Int] = []

func solution(_ numbers:String) -> Int {
        
    let numberList = Array(numbers).map { (char) -> String in
        return String(char)
    }
    
    check = Array(repeating: false, count: numberList.count)
    
    for times in 1...numberList.count{
        DFS(0, 0, times, "", numberList)
    }
    
    return answer
}

func DFS(_ current : Int,_ currentindex : Int ,_ maxPic : Int,_ sum : String ,_ numList : [String]){
    
    if current == maxPic {
        if checkisPrim(Int(sum)!) {
            
            if !dictionary.contains(Int(sum)!){
                print(Int(sum)!)
                    answer += 1
                dictionary.append(Int(sum)!)
            }
        
        }
    }
    else{
        
        for index in 0..<check.count {
        
            if check[index] == false{
                check[index] = true
                DFS(current + 1 , index + 1, maxPic, sum + numList[index], numList )
                check[index] = false
            }
            
        }
    
    
}
    
}
    
    func checkisPrim(_ num : Int) ->  Bool{
        
        if num <= 1{
            return false
        }
        
        if num > 3 {
            
        for index in 2...Int(sqrt(Double(num))){
            
            if num % index == 0 {
                return false
            }
            
        }
            
        }
        
        return true
    }



let numbers = "011"

//print(solution(numbers))

var results:[String] = []

func solution2(_ numbers:String) -> Int {
    let arrayStr = Array(numbers)
    let size = arrayStr.count
    var count = 0
    getNumber(size, arrayStr, 0, "")

    var arrNum:[Int] = []
    for val in results{
        arrNum.append(Int(val)!)
    }

    arrNum = Array(Set(arrNum))

    for i in 0..<arrNum.count{
        if arrNum[i] < 2{
            continue
        }

        var isTrue:Bool = true
        for j in 2..<arrNum[i]{
            if (arrNum[i] % j) == 0{
                isTrue = false
                continue
            }
        }

        if isTrue {
            count = count + 1
        }
    }

    return count
}

func getNumber(_ size: Int, _ numbers: [Character],_ depth: Int,_ value: String){
    var numbers = numbers
    if size == depth{
        return
    }

    for i in 0..<numbers.count{
        let item = numbers[i]
        numbers.remove(at: i)
        results.append(value + "\(item)")
        getNumber(size, numbers, depth+1, value + "\(item)")
        numbers.insert(item, at: i)
    }

}


var sol3Array : [Int] = []

func solution3(_ numbers:String) -> Int{
    
    let array = Array(numbers).map { (char) -> String in
        return String(char)
    }
    
    let size = array.count
    var cnt = 0
    newDFS(size, array, 0, "")
    
    let setList = Array(Set(sol3Array))
    
    for element in setList{
        if checkisPrim(element) {
            cnt += 1
        }
    }
    
    return cnt
}

func newDFS(_ size: Int, _ numbers : [String], _ depth : Int, _ value : String){
    
    var tempNumbers = numbers
    
    if size > depth {
        
        for i in 0..<numbers.count{
            
            let item = tempNumbers[i]
            tempNumbers.remove(at: i)
            sol3Array.append(Int(value + item)!)
            newDFS(size, tempNumbers, depth + 1, value + item)
            tempNumbers.insert(item, at: i)
            
        }
        
    }
    
}

print(solution3(numbers))
