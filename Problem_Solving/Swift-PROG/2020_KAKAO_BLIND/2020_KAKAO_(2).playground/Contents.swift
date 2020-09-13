import UIKit

var answer : [String] = []
var orderList : [String] = []
var maxValue = 0

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    orderList = orders
    
    var arrayList : [String] = []
    
    for element in orders{
        
        let new = element.map { (char) -> String in
            return String(char)
        }
        
        arrayList.append(contentsOf: new)
    }
    
    let setArray = Array(Set(arrayList))
    
    var realAnswer : [String] = []
    
    print(setArray)
    
    for combi in course {
    maxValue = 0
    answer = []
    combination(0, 0, [], combi, setArray)
    
//    print(answer)
//    print(maxValue)
    
    var temp : [String] = []
    for element in answer{
        
        let single = element.map { (char) -> String in
            return String(char)
        }.sorted()
        
        temp.append(single.joined())
        
    }
    
        for element in Array(Set(temp)){
            realAnswer.append(element)
        }
    }
    
    return realAnswer.sorted()
}

func combination(_ current : Int,_ index : Int,_ make : [String] , _ max : Int ,_ setArray : [String]){
    
    var temp = setArray
    var new = make
    
    if current == max{
        
        
        new = make.sorted(by: <)
//                print(new)
        var people = 0
        
        for element in orderList{
            
            let allString = element.map { (char) -> String in
                return String(char)
            }.sorted(by: <)
            
            var cnt = 0
            
            for makeElement in new{
            
                if allString.contains(makeElement) {
                    cnt += 1
                }
                
            }
            
            if cnt == max {
                people += 1
            }
            
        }
        
        if people >= 2{
            
            if people > maxValue{
                maxValue = people
                answer = []
                answer.append(new.joined())
            }
            else if people == maxValue{
                answer.append(new.joined())
            }
        }
        
    }
    else{
        
        for start in index..<temp.count{
            
            let item = temp[start]
            temp.remove(at: start)
            new.append(item)
            combination(current + 1 , start, new, max, temp)
            temp.insert(item, at: start)
            new.removeLast()
            
        }
        
        
    }
    
}

let orders = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
let course = [2,3,4]    

print(solution(orders, course))
