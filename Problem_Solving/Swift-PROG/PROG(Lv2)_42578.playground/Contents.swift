import UIKit

var total : Int = 0

func solution(_ clothes:[[String]]) -> Int {
    
    var dictionary : [String : Int] = [:]
    
    for element in clothes{
        
        if let exist = dictionary[element[1]] {
            dictionary[element[1]] = exist + 1
        }
        else{
            dictionary[element[1]] = 1
        }
        
    }
    
    let array = dictionary.map { (element) -> Int in
        return element.value
    }
    
    for times in 1...array.count{
    combination(array, 0, 0, 1, times)
    }
    
    return total
}

func combination(_ array : [Int],_ cnt : Int , _ currentIndex : Int ,_ select : Int ,_ max : Int){
    
    if cnt == max {
        print(array, select)
        total += select
    }
    else{
        
        var tempArray = array
        
        for index in currentIndex..<array.count {
            let item = array[index]
            tempArray.remove(at: index)
            combination(tempArray, cnt + 1, index, select * item , max)
            tempArray.insert(item, at: index)
        }
        
    }
    
    
}


let clothes : [[String]] = [["yellow_hat", "headgear"],["a","a"],["b","b"],["c","c"]]

print(solution(clothes))
