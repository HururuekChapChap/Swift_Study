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

let boxes = [[1, 2], [1, 3], [1, 1],[2,2]]

print(solution(boxes))

/*

이 문제는 2개의 과일을 담을 수 있는 박스가 있는데 짝이 맞게 해서 포장 할려고 한다.
만약에 짝이 이뤄지지 않는다면 추가로 과일을 구매하게 되는데
과일을 몇개를 더 추가적으로 구매해야하는지 구하는 문제였다.
이때 최대 상자를 넘게 구매할 수 없다.

*/
