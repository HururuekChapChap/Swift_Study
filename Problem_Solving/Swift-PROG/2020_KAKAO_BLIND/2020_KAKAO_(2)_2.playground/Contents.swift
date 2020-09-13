import UIKit

var combinationList : [String] = []
var dict : [String : Int] = [:]
var orderList : [String] = []
var maxValue = 0
var answer : [String] = []


func solution(_ orders:[String], _ course:[Int]) -> [String] {
    
    orderList = orders
    
    var answerDict : [(name : String , maxValue : Int , cur : Int)] = []
    var findDict : [Int : Int] = [:]
    for element in orders{
        
        let new = element.map { (char) -> String in
            return String(char)
        }.sorted()
        
        for cur in course{
            
            combination(0, 0, [], cur, new)
            
            //answer에 해당 조합으로 최대 값이 나옴
//            print(element , cur , maxValue)
            for answerEle in answer{
                
                answerDict.append((answerEle, maxValue , cur))
                
                if let exist = findDict[cur]{
                    
                    if maxValue > exist{
                        findDict[cur] = maxValue
                    }
                    
                }
                else{
                    findDict[cur] = maxValue
                }
                
            }
            
            answer = []
            maxValue = 0
        }
        
    }
    
//   print(answerDict)
//    print()
//    print(findDict)
//
    var realAnser : [String] = []
    
    for cur in course{
        
        let cnt = findDict[cur]
        
        let getAll = answerDict.filter { (element) -> Bool in
            
            if element.cur == cur && element.maxValue == cnt {
                return true
            }
            
            return false
        }
        
        for temp in getAll{
            
            realAnser.append(temp.name)
        }
        
    }
    
//    print(realAnser.sorted(by: <))
    
    
    return realAnser.sorted(by: <)
}

func combination(_ current : Int,_ index : Int,_ make : [String] , _ max : Int ,_ setArray : [String]){
    
    var temp = setArray
    var new = make
    
    if current == max{
        
        let newcombi = new.sorted(by:<).joined()
//        print(newcombi)
        if dict[newcombi] == nil {
            
            dict[newcombi] = 1
            
            var people = 0
            
            for element in orderList{
                
                let allString = element.map { (char) -> String in
                    return String(char)
                }.sorted(by:<)
                
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
            
            if people >= 2 {
                
                if people > maxValue{
                    maxValue = people
                    answer = []
                   answer.append(newcombi)
                }
                else if people == maxValue{
                    answer.append(newcombi)
                }
                
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

let orders = ["XYZ", "XWY", "WXA"]
let course = [2,3,4]

print(solution(orders, course))


