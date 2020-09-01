import UIKit

//0:30
func solution(_ citations:[Int]) -> Int {
    
    //인용 된 논문 수
    var array = Array(repeating: 0, count: citations.max()! + 1 )
    
    for item in citations {
        
        array = array.enumerated().map { (index , element) -> Int in

            return index <= item ? element + 1 : element
        }
    }
    
    var maxItem : Int = 0
    
    for (index, element) in array.enumerated() {
        
        let left = citations.count - element
        
        if element >= index {
            if left <= index {
                print(index , element , left)
                maxItem = max(maxItem , index)
            }
        }
        
    }
    
    return maxItem
}


let citations : [Int] = [3, 0, 6, 1, 5]

print(solution(citations))

