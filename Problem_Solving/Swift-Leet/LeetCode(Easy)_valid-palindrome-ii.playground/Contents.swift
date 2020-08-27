import UIKit

class Solution {
    
    func validPalindrome(_ s: String) -> Bool {

        
        let arrayS = Array(s).map { (char) -> String in
            return String(char)
        }
        
        let end = arrayS.count - 1
        
        for index in 0...end/2{
            
            if arrayS[index] != arrayS[end - index] {
                    
                if !isPalindrome(arrayS, index + 1, end - index) && !isPalindrome(arrayS, index,end - index - 1){
                    return false
                }
                else{
                    return true
                }
                
            }
            
        }
        
        
        return true
    }
    
    func isPalindrome(_ array : [String],_ start : Int, _ end : Int) -> Bool {
        
        var startIndex = start
        var endIndex = end
        
        while startIndex <= endIndex {
            
            if array[startIndex] != array[endIndex] {
                return false
            }
            
            startIndex += 1
            endIndex -= 1
            
        }
        
        return true
    }
    
}

let s : String = "aaab"

Solution().validPalindrome(s)

   
//   abac
//
//aaaaa caba aaaaa
//
//   aaab
