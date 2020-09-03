import UIKit

// 0 : 47
func solution(_ s:String) -> [Int] {
    
    let newS = s.components(separatedBy: "},").map { (element) -> String in
        return element.filter { (char) -> Bool in
            return char == "{" || char == "}" ? false : true
        }
    }.sorted { (ele1, ele2) -> Bool in
        return ele1.count < ele2.count
    }
    
    var dict : [Int : Int] = [:]
    var answer : [Int] = []
    
    for element in newS{
        
        let singleElement = element.components(separatedBy: ",").map { (element) -> Int in
            return Int(element)!
        }
        
        for single in singleElement {
            
            if dict[single] == nil {
                answer.append(single)
                dict[single] = single
            }
            
        }
        
    }
    
    return answer
}

let s = "{{4,2,3},{3},{2,3,4,1},{2,3}}"

print(solution(s))

func solution2(_ s:String) -> [Int] {
    var result: [Int] = []

    var sets = s.split(omittingEmptySubsequences: true, whereSeparator: { "}".contains($0) }).map {
        $0.split(omittingEmptySubsequences: true, whereSeparator: { "{,".contains($0) }).map { Int($0)! }
    }

    sets.sort { (lhs, rhs) -> Bool in
        lhs.count < rhs.count
    }


    sets.forEach {
        result.append(Array(Set($0).subtracting(result)).first!)
    }

    return result
}
