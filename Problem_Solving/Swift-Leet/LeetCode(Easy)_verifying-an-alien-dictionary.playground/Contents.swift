import UIKit

class Solution {
    
    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        
        
        var dictionary : [Character : Int] = [:]
        
        for (index, element) in order.enumerated(){
            
            dictionary[element] = index
            
        }
        
        let temp = words.sorted { (element1, element2) -> Bool in
            
            let array1 = Array(element1)
            let array2 = Array(element2)
            
            for index in 0..<min(array1.count, array2.count){
                
                if dictionary[array1[index]]! < dictionary[array2[index]]! {
                    return true
                }
                else if dictionary[array1[index]]! > dictionary[array2[index]]! {
                    return false
                }
                
            }
            
            
            return element1.count < element2.count ? true : false
        }

        return words == temp ? true : false
    }
    
}

let words : [String] = ["apple","app"]
let order = "abcdefghijklmnopqrstuvwxyz"

Solution().isAlienSorted(words, order)
