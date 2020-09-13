import UIKit

func solution(_ boxes:[[Int]]) -> Int {
    
    let boxesCount = boxes.count
    
    var dict : [Int : Int] = [:]
    
    for element in boxes{
        
        let firstItem = element[0]
        let secondItem = element[1]
        
        if let exist = dict[firstItem]{
            
            dict[firstItem] = exist + 1
            
        }
        else{
            dict[firstItem] = 1
        }
        
        if let exist = dict[secondItem]{
            
            dict[secondItem] = exist + 1
            
        }
        else{
            dict[secondItem] = 1
        }
        
    }
    
    var currentBox = 0
    
    var arrayList = Array(dict)
    
    print(arrayList)
    
    for (index,element) in arrayList.enumerated(){
        
        let cnt = element.value / 2
        let left = element.value % 2
        
        currentBox += cnt
        
        arrayList[index].value = left
        
    }
    
    print(currentBox)
    print(arrayList)
    
    let nopair = arrayList.filter { (element) -> Bool in
        if element.value == 1{
            return true
        }
        
        return false
    }
    
    if nopair.count + currentBox >= boxesCount {
        
        return boxesCount - currentBox
        
    }
    
    return nopair.count
}

let boxes = [[1, 2], [2, 3], [3, 1]]

print(solution(boxes))
