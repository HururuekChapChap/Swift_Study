import UIKit

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var dict : [Character : Int] = [:]
    var answer : Int = 0
    for (index , element) in skill.enumerated(){
        dict[element] = index
    }
    
    let item = Array(skill)
    
    
    for mainElement in skill_trees {
        
        
        let filter = mainElement.filter { (char) -> Bool in
            
            if let _ =  dict[char] {
                return true
            }
            return false
        }
        
        if filter.isEmpty {
            answer += 1
            continue
        }
        
        for (index , element) in filter.enumerated(){
            
            if item[index] != element {
                break
            }
            
            if index+1 == filter.count {
                answer += 1
            }
            
        }
        
        
    }
    
    return answer
}

let skill = "CBD"
let skill_trees = ["BACDE", "CBADF", "AECB", "BDA"]

//print(solution2(skill, skill_trees))


func solution2(_ skill:String, _ skill_trees:[String]) -> Int {

    func available(_ s: String, _ t: String) -> Bool {
        let alza = t.filter { s.contains($0) }
        
        print(alza)
        return s.starts(with: alza)
    }

    return skill_trees.map { available(skill, $0) }.filter { $0 }.count
}

let string  = "abada"
let test = string.filter { (char) -> Bool in
    return char == "a" ? true : false
}

print(test)
var startTest = "aa"

print(test.starts(with: startTest))

startTest = "ab"

print(test.starts(with: startTest))

startTest = ""

print(test.starts(with: startTest))
