import UIKit

// 1: 16
var combi : [[Int]] = []
var isMinum : Bool = true

func solution(_ relation:[[String]]) -> Int {
    
    var list : [Int] = []
    
    for start in 0..<relation[0].count{
        list.append(start)
    }
    
    for find in 1...relation[0].count{
    combination(0, 0, find, list, [])
    }
    
    var uniquList : [[Int]] = []
    
    for element in combi{
        
        //유일성을 만족하는가
        if isprimary(element, relation){
            
            uniquList.append(element)
            
        }
    
    }
    
//    for element in uniquList {
//        print(element)
//    }
    
//    print("정답")
    
    var answer = 0
    
    //최소성을 만족하는가
    for unique in uniquList {
        
        let index = uniquList.firstIndex(of: unique)!
        
        uniquList.remove(at: index)
        
        for start in 1...unique.count{
            
//            print("start : \(start)")
            
            
            if isMinum {
                minumlity(0, start, 0, unique, [], uniquList)
            }
            else{
                break
            }
            
            if start == unique.count && isMinum{
                print(unique)
                answer += 1
            }
            
        }
        
        uniquList.insert(unique, at: index)
        
        

        isMinum = true
        
    }
    
    
    
    
    return answer
}

func minumlity(_ current : Int , _ max : Int, _ index : Int ,_ list : [Int], _ answer : [Int] ,_ unique : [[Int]]){
    
    var temp = list
    var tempAnswer = answer
    
//    print("temp : \(temp) ")
    
    if isMinum == true {
    
    if current == max {
        
        if unique.contains(answer) {
//            print(answer)
            isMinum = false
        }
        
        
    }
    else{
        
        for start in index..<list.count{
            
            let item = temp[start]
            temp.remove(at: start)
            tempAnswer.append(item)
            
            minumlity(current + 1, max, start, temp, tempAnswer, unique)
            
            temp.insert(item, at: start)
            tempAnswer.removeLast()
            
            
        }
        
    }
        
    }
    
    
}

func isprimary(_ element : [Int], _ relation : [[String]]) -> Bool {
    
    var diction : [String : Int] = [:]
    
    //make String
    for tuple in relation{
        
        var inputString : String = ""
        
        for (index, single) in tuple.enumerated(){
            
            for elementSingle in element {
                
                if elementSingle == index {
                    
                    inputString += single + " "
                    
                }
                
            }
            
        }
        
        if let _  = diction[inputString] {
            return false
        }
        else{
            diction[inputString] = 1
        }
         
    }
    
    
    return true
}

func combination(_ current : Int , _ index : Int , _ max : Int, _ list : [Int], _ answer: [Int]){
    
    var temp = list
    var tempAnswer = answer
    
    if current == max {
        
        combi.append(answer)
        
    }
    else{
        
        for start in index..<temp.count {
            
            let item = temp[start]
            temp.remove(at: start)
            tempAnswer.append(item)
            combination(current + 1, start, max, temp, tempAnswer)
            temp.insert(item, at: start)
            tempAnswer.removeLast()
            
        }
        
        
    }
    
}

let relation = [["100","ryan","music","2"],["200","apeach","math","2"],["300","tube","computer","3"],["400","con","computer","4"],["500","muzi","music","3"],["600","apeach","music","2"]]

print(solution(relation))
