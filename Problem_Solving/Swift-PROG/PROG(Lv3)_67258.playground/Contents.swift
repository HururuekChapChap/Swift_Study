import UIKit

func solution(_ gems:[String]) -> [Int] {
    
    var dict : [String : Int] = [:]
    var answer : [(start : Int , end : Int)] = []
    var start = 0
    var end = 0
    
    var endPoint = 0
    
    for (index,element) in gems.enumerated(){
        
        if let exist = dict[element]{
            dict[element] = exist + 1
        }
        else{
            dict[element] = 1
            endPoint = index
        }
            
    }
    
    answer.append((start, endPoint))
    
    while start < gems.count && endPoint < gems.count {
        
        start += 1
        endPoint += 1
        
        
        
        
    }
        
    
    return []
}

let gems = ["AA", "AB", "AC", "AA", "AC"]

solution(gems)
