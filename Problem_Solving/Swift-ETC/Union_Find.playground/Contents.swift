import UIKit

func getParent(_ list : inout [Int] , number : Int) -> Int{
    
    if list[number] == number {return number}
    
    list[number] = getParent(&list, number: list[number])
    
    return list[number]
}

func unionParent(_ list : inout [Int], _ a : Int , _ b : Int){
    
    let aParent = getParent(&list, number: a)
    let bParent = getParent(&list, number: b)
    
    if aParent < bParent {
        list[bParent] = aParent
    }
    else{
        list[aParent] = bParent
    }
    
}

func isSibling(_ list : inout [Int], _ a : Int, _ b : Int) -> Bool{
    
    let aParent = getParent(&list, number: a)
    let bParent = getParent(&list, number: b)
    
    return aParent == bParent
}

var list = Array(repeating: <#T##_#>, count: <#T##Int#>)
