import UIKit

let expression = "100-200*300-500+20"

var staticCombination : [[String]] = [[]]
var staticVisited :[Int] = []
var nextList : [Int] = []

func Combination(_ list : [String], _ current : Int){
    
    if current == list.count{
        for element in nextList{
            staticCombination[staticCombination.count-1].append(list[element])
        }
        staticCombination.append([])
    }
    else{
        
        for i in 0..<list.count{
            
            if staticVisited[i] == 0 {
                staticVisited[i] = 1
                nextList.append(i)
                Combination(list,current + 1)
                nextList.remove(at: nextList.count - 1)
                staticVisited[i] = 0
            }
            
        }
        
    }
    
}

func solution(_ expression:String) -> Int64 {
    
    let tempExp = expression.map { (char) -> String in
        String(char)
    }
    
    var numberList = expression.components(separatedBy: ["-", "*", "+"])
    
    print(numberList)
    
    var list : [String] = []
    var everyList : [String] = []
    for item in tempExp{
        
        if item == "-" || item == "*" || item == "+" {
            
            everyList.append(item)
            
            if list.count == 0{
                list.append(item)
            }
            else{
                
                if !list.contains(item){
                    list.append(item)
                }
                
            }
        }
        
    }
    
    for _ in 0..<list.count{
        staticVisited.append(0)
    }
    
    Combination(list,0)
    
    

    for i in 0..<staticCombination.count-1{

        var tempNumberList = numberList
        var tempEveryList = everyList
        var deleteEveryList : [Int] = []
        
        for item in staticCombination[i]{
            
            
            for index in 0..<tempEveryList.count{
                
                if item == tempEveryList[index] {
                    
                    deleteEveryList.append(index)
                    
                    if item == "*"{
                        let tempnum = Int64(tempNumberList[index])! * Int64(tempNumberList[index + 1])!
                        
                        tempNumberList.remove(at: index)
                        tempNumberList.insert(String(tempnum), at: index)
                        tempNumberList.remove(at: index+1)
                        
                        
                    }
                    else if item == "+"{
                        
                        let tempnum = Int64(tempNumberList[index])! + Int64(tempNumberList[index + 1])!
                        
                        tempNumberList.remove(at: index)
                        tempNumberList.insert(String(tempnum), at: index)
                        tempNumberList.remove(at: index+1)
                        
                        
                    }
                    else if item == "-"{
                        
                        let tempnum = Int64(tempNumberList[index])! - Int64(tempNumberList[index + 1])!
                        
                        tempNumberList.remove(at: index)
                        tempNumberList.insert(String(tempnum), at: index)
                        tempNumberList.remove(at: index+1)
                        
                        
                    }
                    
                }
                
            }
            
            
            for j in 0..<deleteEveryList.count{
                tempEveryList.remove(at: deleteEveryList[j])
            }
            
            deleteEveryList = []
            

        }
        
        

    }
    
    
    
    return 0
}

solution(expression)


