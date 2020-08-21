import UIKit

class Solution {
    
    func backspaceCompare(_ S: String, _ T: String) -> Bool {
        
        let arrayS = Array(S)
        let arrayT = Array(T)
        
        var listS : [String] = []
        var listT : [String] = []
        
        for element in arrayS{
            check( String(element) , &listS)
        }
        
        for element in arrayT{
            check( String(element) , &listT)
        }
        
        let tempS = listS.reduce("", +)
        let tempT = listT.reduce("", +)
            
        return tempS == tempT ? true : false
        
    }
    
    private func check(_ char : String , _ list : inout [String]){
        
        if char == "#"{
            if list.isEmpty == false{
            list.removeLast()
            }
            return
        }
            
        list.append(char)
    }
    
    func twoPointer(_ S: String, _ T: String) -> Bool {
    
        let S_array = Array(S).reversed().map { (element) -> String in
            return String(element)
        }
        let T_array = Array(T).reversed().map { (element) -> String in
            return String(element)
        }
        
        var s_location = 0
        var t_location = 0
        var s_skip = 0
        var t_skip = 0
        
        while s_location < S.count || t_location < T.count{
            
            while s_location < S.count{
                if S_array[s_location] == "#" {s_skip += 1}
                else if s_skip > 0 {s_skip -= 1}
                else {break}
                s_location += 1
            }
            
            while t_location < T.count{
                if T_array[t_location] == "#" {t_skip += 1}
                else if t_skip > 0 {t_skip -= 1}
                else {break}
                t_location += 1
            }
            
            if s_location < S.count && t_location < T.count{
                
                if S_array[s_location] != T_array[t_location] {return false}
                
            }
            else if (s_location < S.count && t_location >= T.count) || (s_location >= S.count && t_location < T.count ){
                return false
            }
            
            s_location += 1
            t_location += 1
            
        }
        
        
        return true
    }
    
    
    
}

let S = "a#v#ca#b#"
let T =  "c"

print(Solution().twoPointer(S, T))
