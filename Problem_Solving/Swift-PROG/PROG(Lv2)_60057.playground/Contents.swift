import UIKit

func solution(_ s:String) -> Int {
    
    let last = s.count / 2
    
    var current = 1
    let arrayOfs = Array(s)
    var answer = 1001
    
   while current <= last {
                
    let left = arrayOfs.count % current
    var string = ""
    var index = 0
    var cnt = 1
    
    while index < arrayOfs.count - left {
        
        let jump = index+current
        
        let word = arrayOfs[index..<jump]
        
        index = jump
        
        if jump + current > arrayOfs.count - left {
            
            string += makeString(cnt, String(word))
            break
            
        }
    
        let next = arrayOfs[jump..<jump+current]
        
        if word != next {
            string += makeString(cnt, String(word))
            cnt = 0
        }
        cnt += 1
        
    }
    
    if index < arrayOfs.count {
        string += String(arrayOfs[index..<arrayOfs.count])
    }
    
    //print(string)
    answer = min(answer,string.count)
    current += 1
        
    }
    
    return answer
}

func makeString(_ cnt : Int ,_ word: String) -> String{
    
    let number = cnt == 1 ? "" : String(cnt)
    return (number + word)
}


let s =  "x"

print(solution(s))
