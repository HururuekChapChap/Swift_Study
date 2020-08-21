import UIKit

let strings : [String] = ["abc", "abe", "kgs", "cxd"]
let n : Int = 1

func solution(_ strings:[String], _ n:Int) -> [String] {
    
    var answer : [String] = []
    
    for index in 0..<strings.count {
            
        let indexElement = Array(strings[index])
        
        var start = answer.count - 1
        
        answer.append(strings[index])
        
        while start >= 0 {
            
            let startElement = Array(answer[start])
            
            if indexElement[n] < startElement[n] {
                 answer[start + 1] = answer[start]
             }
             else if indexElement[n] == startElement[n] && strings[index] < answer[start]{
                 answer[start + 1] = answer[start]
             }
             else{
                 break
             }
            
            start -= 1
            
        }
        
        answer[start + 1] = strings[index]

    }
    
    
    return answer
}

func RightSolution(_ strings:[String], _ n:Int) -> [String]{
    
    return strings.sorted { (index1, index2) -> Bool in
        
        print(Array(index1)[n] , Array(index2)[n])
        
        if Array(index1)[n] == Array(index2)[n] {
            print(1)
            return index1 < index2
        }
        else if Array(index1)[n] < Array(index2)[n] {
            print(2)
            return Array(index1)[n] < Array(index2)[n]
        }
            print(3)
            return false
    }
    
}

func WrongSolution(_ strings:[String], _ n:Int) -> [String]{
    
    return strings.sorted { (index1, index2) -> Bool in
        
        let elementArray1 = Array(index1)
        let elementArray2 = Array(index2)
        
        if elementArray1[n] == elementArray2[n] {
            return index1 < index2
        }
      
        return elementArray1[n] < elementArray2[n]
    }
    
}

//print(RightSolution(strings, n))

func solution2(_ strings:[String], _ n:Int) -> [String]{
    
    return strings.sorted { (element1, element2) -> Bool in
        
        
        let char1 = element1.index(element1.startIndex, offsetBy: n)
        let char2 = element2.index(element2.startIndex, offsetBy: n)
        
        print(element1, element1[char1] , element2, element2[char2])
        
        if element1[char1] == element2[char2] {
            print(1)
            return element1 < element2
        }
        
//        if char1 < char2 {
//            print(2)
//            return char2 < char1
//        }
        print(3)
        return element1[char1] > element2[char2]
    }
    
    
}


func solution3(_ strings:[String], _ n:Int) -> [String] {
    var strings = strings
    strings.sort {
        let i = $0.index($0.startIndex, offsetBy: n)
        let j = $1.index($1.startIndex, offsetBy: n)
        print($0 , $1)
        if $0[i] < $1[j] {
            print(1)
            return $0[i] < $1[j]
        }else if $0[i] == $1[j] {
            if $0 < $1 {
                print(2)
                return $0 < $1
            }
        }
        print(3)
        return false
    }

    return strings
}


//print(solution2(strings, n))
//print(solution3(strings, n))


struct Info {
    let name : String
    let age : Int
}

let list = [Info(name: "a", age: 12),Info(name: "b", age: 12),Info(name: "c", age: 42),Info(name: "d", age: 64),Info(name: "e", age: 12),Info(name: "f", age: 15)]


func sortSolution(_ list : [Info]) -> [Info]{
    
    return list.sorted { (element1, element2) -> Bool in
        
        if element1.age == element2.age{
            return element1.name < element2.name
        }
        else if element1.age < element2.age{
            return true
        }
        
        return false
    }
    
}

print(sortSolution(list))
