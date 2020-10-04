import UIKit

func solution(_ operations:[String]) -> [Int] {
    
    var maxHeap : [Int] = []
    
    for element in operations{
        
        let split = element.components(separatedBy: " ")
        let commend = split[0]
        let number = split[1]
        
        if commend == "I"{
            
            makeMAXHeap(&maxHeap, Int(number)!)
        }
        else {
            
            if maxHeap.isEmpty {continue}
            
            if number == "1"{
                    
                maxHeap.removeLast()
                
            }
            else{
                
                maxHeap.removeFirst()
                
            }
            
        }
        
    }
    
    print(maxHeap)
    
    return maxHeap.isEmpty ? [0,0] : [maxHeap.max()! , maxHeap.min()!]
}

func makeMAXHeap (_ maxHeap : inout [Int] ,_ number : Int){
    
    var start = 0
    var end = maxHeap.count - 1
    
    if maxHeap.isEmpty {
        maxHeap.append(number)
        return
    }
    
    while start <= end {
        
        let mid = (start + end) / 2
        
        if maxHeap[mid] < number {
            start = mid + 1
        }
        else{
            end = mid - 1
        }
    }
    
    maxHeap.insert(number, at: start)
    
}

let operation = ["I 16", "I -5643", "D -1", "D 1", "D 1", "I 123", "D -1"]

print( solution(operation))

