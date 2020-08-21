import UIKit

func solution(_ x:Int) -> Bool {
    
    let numbers : [Int] = Array(String(x)).map { (element) -> Int in
        return Int(String(element))!
    }
    
    let total = numbers.reduce(0, +)
    
    return x % total == 0 ? true : false
}

//solution(12)

func solution2(_ phone_number:String) -> String {
    
    let tempPN = phone_number.enumerated().map { (index, element) -> String in
        
        if index >= phone_number.count - 4 {
            return String(element)
        }
        
        return "*"
    }
    
    return tempPN.joined(separator: "")
}

let ph = "027778888"

solution2(ph)


print(ph.map({ (char) -> String in
    return String(char)
}))

for (index,element) in ph.enumerated(){
    print(index , element)
}
