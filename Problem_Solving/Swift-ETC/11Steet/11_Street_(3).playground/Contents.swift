import UIKit

public func solution(_ S : inout [String]) -> [Int] {
    // write your code in Swift 4.2.1 (Linux)
    
    var dict : [String : [Int]] = [:]
    
    for (i ,element) in S.enumerated() {
        
        let s = Array(element).map { (char) -> String in
            return String(char)
        }
        
        for (index , item) in s.enumerated(){
            
            let new = "\(index)\(item)"
            
            dict[new , default : []].append(i)
            
        }
        
    }
    
    let filter = dict.filter { (element) -> Bool in
        return element.value.count > 1
    }
    
    if filter.isEmpty {return []}
    
    let item = filter.first!
    
    let number = Int(String(Array(item.key)[0]))!
    let first = item.value[0]
    let second = item.value[1]
    
    return [first , second , number]
}

var S = ["bdafg" , "cdagi"]

print(solution(&S))
