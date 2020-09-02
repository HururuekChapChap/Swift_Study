import UIKit

//func solution(_ numbers:[Int], _ target:Int) -> Int {
//
//    var answer : Int = 0
//
//    let total = numbers.reduce(0, +)
//    var queue : [(total : Int , minus : Int, index : Int )] = [(total, 0, 0)]
//
//        while !queue.isEmpty {
//
//            let currentTotal = queue.first!.total
//            let totalMinus = queue.first!.minus
//            let index = queue.first!.index
//
//            queue.removeFirst()
//

//
//            if currentTotal + totalMinus == target {
//                answer += 1
//                continue
//            }
//
//            if index < numbers.count{
//
//            let nextTotal = currentTotal - numbers[index]
//            let nextMinus = totalMinus - numbers[index]
//
//            if nextTotal > target {
//                queue.append((nextTotal, nextMinus, index + 1))
//            }
//
//            queue.append((currentTotal, totalMinus, index + 1))
//
//            }
//
//        }
//
//
//
//
//    return answer
//}


func solution(_ numbers:[Int], _ target:Int) -> Int {

    var queue : [Int] = [0]

    var answer : Int = 0

    var total = numbers.reduce(0, +)

    for index in 0...numbers.count {

        var tempQueue : [Int] = []
        var plusPoint : Int = 0

        if index != numbers.count {
            plusPoint = numbers[index]
        }

//        print("새로운 시작 : \(plusPoint)")

        while !queue.isEmpty {

            let item = queue.first!
//            print(item)
            queue.removeFirst()

            if item == target && index == numbers.count {
                answer += 1
            }

            if item + total >= target {

                if item - total < target{
                    tempQueue.append(item + plusPoint)
                }

                tempQueue.append(item - plusPoint)
            }

        }

        total -= plusPoint
        queue = tempQueue

    }

    return answer
}


func solution2(_ numbers:[Int], _ target:Int) -> Int {

    var queue : [Int] = [0]
    var tempQueue : [Int] = []
    var answer = 0

    for index in 0...numbers.count {
        
        var plusPoint = 0
        
        if index != numbers.count {
            plusPoint = numbers[index]
        }
        
        if index == numbers.count {
            
            answer = queue.filter { (element) -> Bool in
                return element == target ? true : false
            }.count
        
            break
        }
        
        var cnt = 0
        
        while cnt < queue.count {
            
            let item = queue[cnt]
//            queue.remove(at: 0)
            
            tempQueue.append(item + plusPoint)
            tempQueue.append(item - plusPoint)
            
            cnt += 1
        }
        
        queue = tempQueue
        tempQueue = []
        
    }
    
    return answer
    
}

let numbers : [Int] = [1, 1, 1, 1, 1]
let target : Int = 3

print(solution2(numbers, target))


func solution3(_ numbers:[Int], _ target:Int) -> Int {

    var queue : [Int] = [0]
    var tempQueue : [Int] = []
    var answer = 0

    for index in 0...numbers.count {
        
        var plusPoint = 0
        
        if index != numbers.count {
            plusPoint = numbers[index]
        }
        
        if index == numbers.count {
            
            answer = queue.filter { (element) -> Bool in
                return element == target ? true : false
            }.count
        
            break
        }
        
        for element in queue{
            
            tempQueue.append(element + plusPoint)
            tempQueue.append(element - plusPoint)
            
        }
        
        queue = tempQueue
        tempQueue = []
        
    }
    
    return answer
    
}
