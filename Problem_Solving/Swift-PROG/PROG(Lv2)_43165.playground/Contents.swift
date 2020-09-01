import UIKit

func solution(_ numbers:[Int], _ target:Int) -> Int {

    var answer : Int = 0
    
    let total = numbers.reduce(0, +)
    var queue : [(total : Int , minus : Int, index : Int )] = [(total, 0, 0)]
        
        var cnt = 0
     
        
        while !queue.isEmpty {
            
            let currentTotal = queue.first!.total
            let totalMinus = queue.first!.minus
            let index = queue.first!.index
            
            queue.removeFirst()
            
//            print(currentTotal , totalMinus)
            
            if currentTotal + totalMinus == target {
                answer += 1
                continue
            }
            
            let nextTotal = currentTotal - numbers[index]
            let nextMinus = totalMinus - numbers[index]
            
            if nextTotal > target {
                queue.append((nextTotal, nextMinus))
            }
            
            tempQueue.append((currentTotal, totalMinus))
            
        }

        
   
    
    return answer
}

func searchTarget(number: [Int], depth: Int, target: Int, value: Int, answer: inout Int) {

    // MARK: - 사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.
    if depth >= number.count {
        if target == value { answer = answer + 1 }
        return
    }

    // MARK: - 이 수를 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다.
    searchTarget(number: number, depth: depth + 1, target: target, value: value + number[depth], answer: &answer)
    searchTarget(number: number, depth: depth + 1, target: target, value: value - number[depth], answer: &answer)
}

func solution2(_ numbers:[Int], _ target:Int) -> Int {

    var answer = 0
    searchTarget(number: numbers, depth: 0, target: target, value: 0, answer: &answer)

    return answer
}


let numbers : [Int] = [1, 1, 1, 1, 1,1, 1, 1, 1, 1,1, 1, 1, 1, 1,1, 1, 1, 1, 1]
let target : Int = 3

print(solution2(numbers, target))


//func solution(_ numbers:[Int], _ target:Int) -> Int {
//
//    var queue : [Int] = [0]
//
//    var answer : Int = 0
//
//    var total = numbers.reduce(0, +)
//
//    for index in 0...numbers.count {
//
//        var tempQueue : [Int] = []
//        var plusPoint : Int = 0
//
//        if index != numbers.count {
//            plusPoint = numbers[index]
//        }
//
////        print("새로운 시작 : \(plusPoint)")
//
//        while !queue.isEmpty {
//
//            let item = queue.first!
////            print(item)
//            queue.removeFirst()
//
//            if item == target && index == numbers.count {
//                answer += 1
//            }
//
//            if item + total >= target {
//
//                if item - total < target{
//                    tempQueue.append(item + plusPoint)
//                }
//
//                tempQueue.append(item - plusPoint)
//            }
//
//        }
//
//        total -= plusPoint
//        queue = tempQueue
//
//    }
//
//    return answer
//}
