import UIKit

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    
    var visited : [Bool] = Array(repeating: false, count: words.count)
    
    var queue : [(word : String , cnt : Int)] = [(begin , 0)]
    
    while !queue.isEmpty {
        
        let item = queue.removeLast()
        
        if item.word == target {
            return item.cnt
        }
        
        for (index , element) in words.enumerated() {
            
            let singleItem = Array(item.word)
            let singleWord = Array(element)
            
            var diffCnt = 0
            
            for (itemindex , alphabet) in singleWord.enumerated() {
                
                if singleItem[itemindex] != alphabet {
                    diffCnt += 1
                }
                
            }
            
            if diffCnt == 1 && !visited[index]{
                visited[index] = true
                queue.insert((element, item.cnt + 1), at: 0)
            }
            
            
        }
        
    }
    
    
    return 0
}

let begin = "hit"

let target = "cog"

let words = ["hot", "dot", "dog", "lot", "log"]

print(solution(begin, target, words))
