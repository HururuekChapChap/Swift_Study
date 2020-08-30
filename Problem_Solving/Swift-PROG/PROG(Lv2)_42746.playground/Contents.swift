import UIKit

func solution(_ numbers:[Int]) -> String {
    
    var makeString = numbers.map { (element) -> String in
        return String(element)
    }
    
    makeString = makeString.sorted(by: { (element1, element2) -> Bool in
        
        let oneTwo = Int(element1 + element2)!
        let twoOne = Int(element2 + element1)!
        
        return oneTwo > twoOne ? true : false
    })
    

    let filter = makeString.filter { (element) -> Bool in
        return element == "0" ? true : false
    }
    
    if filter.count == makeString.count {
        return "0"
    }
    
    return makeString.joined()
}

let numbers : [Int] = [0, 0]

print(solution(numbers))

let element1 = "355000"

let split1 = element1.split { (element) -> Bool in
           return element == "0" ? true : false
       }

//print(split1)
