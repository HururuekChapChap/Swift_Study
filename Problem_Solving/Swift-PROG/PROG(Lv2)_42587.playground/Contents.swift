import UIKit

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var stack : [(pri : Int , location : Int)] = []
    var answer : Int = 0
    for index in 0..<priorities.count {
        stack.append((priorities[index], index))
    }
    
    while !stack.isEmpty {
        
        let topElement = stack[0].pri
        
        var isover = -1
        
        for (index, element) in stack.enumerated(){
            
            if element.pri > topElement {
                isover = index
                break
            }
            
        }
        
        if isover != -1 {
            
            var tempStack : [(pri : Int , location : Int)] = []
            
            for _ in 0..<isover{
                tempStack.append((pri: stack[0].pri, location: stack[0].location))
                stack.removeFirst()
            }
            
            stack.append(contentsOf: tempStack)
        
        }
        else{
            
            answer += 1
            
            let removedLocation = stack.removeFirst().location
            
            if removedLocation == location {
                return answer
            }
            
        }
        
//        print(isover)
//        print(stack)
//
    }
    
    return 0
}

let priority = [1,1,9,1,1,1]
let location = 0

//print(solution(priority, location))

print(priority.contains(where: { (element) -> Bool in
    return element > priority[0] ? true : false
}))


func solution2(_ priorities:[Int], _ location:Int) -> Int {
    var cPriorities = priorities
    var targetIndex = location

    while cPriorities.count > 0 {
        if cPriorities.contains(where: { $0 > cPriorities[0] }) {
            let first = cPriorities.removeFirst()
            cPriorities.append(first)
            targetIndex = targetIndex - 1 < 0 ? cPriorities.count - 1 : targetIndex - 1
        } else {
            if(targetIndex == 0) {
                return priorities.count - cPriorities.count + 1
            }

            cPriorities.removeFirst()
            targetIndex = targetIndex - 1
        }
    }

    return 0
}
