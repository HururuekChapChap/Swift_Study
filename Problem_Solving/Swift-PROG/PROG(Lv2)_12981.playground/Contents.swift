import UIKit

func solution(_ n:Int, _ words:[String]) -> [Int] {
    
    var dict : [String : Int] = [:]
    
    for (index , element ) in words.enumerated() {
        
        let player = (index % n) + 1
        let cnt = (index / n ) + 1
        
        let startWord = words[index].index(words[index].startIndex, offsetBy: 0)
        
        if dict[element] != nil {
            return [player , cnt]
        }
        else if index != 0 && words[index - 1][words[index - 1].index(before: words[index - 1].endIndex)] != element[startWord] {
            return [player , cnt]
        }
        
        dict[element] = 1
        
    }
    
    
    return [0,0]
}


let n = 5

let word = ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]

print(solution(n, word))
