import UIKit

var dict : [String : [(String,Int)]] = [:]
var visited : [Bool] = []
var returnAnswer : [String] = []

func solution(_ tickets:[[String]]) -> [String] {
    
    visited = Array(repeating: true, count: tickets.count)
    
    for (index , element) in tickets.enumerated(){
        
        dict[element[0] , default : []].append((element[1], index))
        
    }
    
    DFS("ICN" , ["ICN"], tickets.count + 1)
    
    return returnAnswer
}

func DFS(_ start : String, _ answer : [String], _ max : Int) {
    
    var temp = answer
    
    let arraySort = dict[start , default : []].filter { (element) -> Bool in
        return visited[element.1] == true
    }.sorted { (element1, element2) -> Bool in
        return element1.0 < element2.0
    }
    
    if arraySort.isEmpty {
        
        if !visited.contains(true) && returnAnswer.isEmpty{
            returnAnswer = answer
        }
        
        return
    }
    
    
    for element in arraySort {
        
        visited[element.1] = false
        temp.append(element.0)
        DFS(element.0, temp, max)
        visited[element.1] = true
        temp.removeLast()
        
    }
    
}

let tickets = [["ICN", "BOO"], ["ICN", "DOO"], ["ICN", "COO"],["COO","ICN"],["DOO","ICN"]]

print(solution(tickets))
