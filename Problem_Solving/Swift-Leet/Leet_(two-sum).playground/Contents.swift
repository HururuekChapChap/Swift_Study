import UIKit

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    for ele1 in 0..<nums.count{
        
        for ele2 in (ele1+1)..<nums.count{
            
            if nums[ele1] + nums[ele2] == target && nums[ele1] != nums[ele2]{
                return [ele1, ele2]
            }
            
        }
    }
    
    return []
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    
    var dic : [Int : Int] = [:]
    
    for index in 0..<nums.count{
        dic[index] = nums[index]
    }
    
    for index in 0..<nums.count{

        let findValue = target - nums[index]
        
        let valueArray = dic.filter { (element) -> Bool in
            
            if element.key == index{
                return false
            }
            
            return element.value == findValue
        }
       
        if valueArray.count != 0 {
            return [index, valueArray.first!.key].sorted()
        }

    }

    return []
}

func twoSum3(_ nums: [Int], _ target: Int) -> [Int]{
    
    var dic : [Int : Int] = [:]
    
    for (index, val) in nums.enumerated(){
        
        let need = target - val
        
        if let index2 = dic[need]{
            return [index, index2].sorted()
        }
        
        dic[val] = index
    }
    
    return []
}

let nums = [3,3,7]
let target = 6

print(twoSum3(nums, target))
