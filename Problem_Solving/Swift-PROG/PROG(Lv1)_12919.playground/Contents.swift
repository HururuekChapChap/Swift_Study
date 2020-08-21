import UIKit

func solution(_ seoul:[String]) -> String {
    
//    for (index, val) in seoul.enumerated(){
//
//        if val == "Kim"{
//            return "김서방은 \(index)에 있다"
//        }
//
//    }
    
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

let seoul = ["Jane", "Kim"]

print(solution(seoul))

