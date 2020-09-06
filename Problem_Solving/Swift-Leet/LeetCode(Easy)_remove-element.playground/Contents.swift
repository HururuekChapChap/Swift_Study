import UIKit

class Solution {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        
        var index = 0
        
        while index < nums.count {
            
            if nums[index] == val{
                nums.remove(at: index)
            }
            else{
                index += 1
            }
            
        }
        
        return nums.count
        
    }
    
}

var nums = [0,1,2,2,3,0,4,2]
let val = 2

//print(Solution().removeElement(&nums, val))
//print(nums)

var temp = [0,1,2,2,3,0,4,2]

var index = 0

//for num in temp {
//
//    if num == val {
//        temp.remove(at: index)
//    }
//    else{
//        index += 1
//    }
//
//    print(temp)
//
//}

let dictionary : [String : Int] = ["A":1 , "B":2 , "C":3 , "D":4]

let array = Array(dictionary).map { (element) -> Int in
    return element.value
} // 튜플의 형태로 저장된다.

let arraySet = Set(array)

print(arraySet)


let tempArray : [(n : String , t : String)] = []

func classifyStore(_ storeHash : [ String : [ String ] ], _ tag : String) -> [ String ]{
return storeHash[tag] ?? []
}

func classifyStore(_ inputArray : [ (name : String, tag : String) ] , _ tag : String) -> [ (String, String) ] {
var index = 0
var storeArray = inputArray
while index < storeArray.count {
    if storeArray[index].tag != tag {
        storeArray.remove(at: index)
}else{
    index += 1
}
}
return storeArray
}
