import UIKit

func solution(_ s:String) -> Int {
    
    let s_list = s.map { (char) -> String in
        return String(char)
    }
    
    var maxValue = 0
    
    for (index , element) in s_list.enumerated(){
        
        if index + 1 < s_list.count && element == s_list[index + 1]{
            
            maxValue = max( makeString(index, index, 0, s_list) * 2 + 1, makeString(index, index + 1, 0, s_list) * 2 + 2, maxValue )
        
            
        }
        else{
            
           maxValue = max(  makeString(index, index, 0, s_list) * 2 + 1, maxValue )
        }
        
        print(index , maxValue)
        
    }
    
    return maxValue
}

func makeString(_ lhsIndex : Int ,_ rhsIndex : Int,_ cnt : Int ,_ list : [String]) -> Int{
    
    if lhsIndex - 1 < 0 || rhsIndex + 1 >= list.count {return cnt}
    
    if list[lhsIndex - 1] == list[rhsIndex + 1] {
        return makeString(lhsIndex - 1, rhsIndex + 1, cnt + 1, list)
    }
    
    return cnt
}


func checkIsPalindrome(_ s : [String]) -> Bool {
    
    var start = 0
    var end = s.count - 1
    
    while start < end {
        
        if s[start] != s[end] {
            return false
        }
        
        start += 1
        end -= 1
        
    }
    
    return true
}

let s = "abaab"

print(solution(s))
