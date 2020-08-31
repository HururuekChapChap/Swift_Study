import UIKit

func solution(_ p:String) -> String {
    
    let lists : [String] = Array(p).map({ (char) -> String in
        return String(char)
    })
    
    if lists.isEmpty{
        return ""
    }
    
    var answer = ""
    var tempStack = ""
    var braketCnt = 0
    var stack : [String] = []
    var pushStack : [String] = []
    
    for (index , element) in lists.enumerated() {
        
        if element == "("{
            braketCnt += 1
            stack.append(element)
        }
        else if element == ")"{
            braketCnt -= 1
            
            if !stack.isEmpty && stack.last == "("{
                stack.removeLast()
            }
        }
       
        tempStack.append(element)
        
        if braketCnt == 0 || index + 1 == lists.count{
            
            if stack.isEmpty && braketCnt == 0 {
                answer += tempStack
            }
            else{
                
                answer += "("
                
                var tempStackToString = tempStack.map { (char) -> String in
                    return String(char)
                }
                
                tempStackToString.removeFirst()
                tempStackToString.removeLast()
                
                for (index , element) in tempStackToString.enumerated() {
                    
                    if element == "(" {
                        tempStackToString[index] = ")"
                    }
                    else if element == ")"{
                        tempStackToString[index] = "("
                    }
                    
                }
                
                pushStack.insert(")"+tempStackToString.joined(), at: 0)
                
            }
            
            tempStack = ""
            stack = []
            
        }
        
    }
    
    print(answer)
    print(pushStack)

    return answer + pushStack.joined()
}


let p = "))(()())(("
//print(solution(p))

let startindex = p.index(p.startIndex, offsetBy: 3)
let endindex = p.index(p.startIndex, offsetBy: 6)

//print(p[startindex...endindex])

func solution2(_ p : String) -> String{
        
    return solve(p)
}

func solve(_ word : String) -> String{
    
    if word.isEmpty {
        return ""
    }
    
    var answer = ""
    
    let uvBlance = splitToUV(word)
    
    if uvBlance.blance {
        answer += uvBlance.u + solve(uvBlance.v)
    }
    else{
        answer += "("
        answer += solve(uvBlance.v)
        answer += ")"
        
        let startIndex = uvBlance.u.index(after: uvBlance.u.startIndex)
        let endIndex = uvBlance.v.index(before: uvBlance.u.endIndex)
        
        let middleWord = uvBlance.u[startIndex..<endIndex]
        
        for char in middleWord {
            
            if char == "("{
                answer += ")"
            }
            else if char == ")"{
                answer += "("
            }
            
        }
        
    }
    
    
    return answer
}

func splitToUV(_ word : String) -> (u : String, v : String, blance : Bool) {
    
    var blanceCnt : Int = 0
    var stack : [Character] = []
    var u : String = ""
    var v : String = ""
    for (index , element) in word.enumerated() {
        
        if element == "(" {
            blanceCnt += 1
            stack.append(element)
        }
        else if element == ")" {
            blanceCnt -= 1
            
            if !stack.isEmpty && stack.last == "(" {
                stack.removeLast()
            }
            
        }
        
        if blanceCnt == 0 {
            let splitIndex = word.index(word.startIndex, offsetBy: index + 1)
            u = String(word[word.startIndex..<splitIndex])
            v = String(word[splitIndex..<word.endIndex])
            break
        }
        
    }
    
    if stack.isEmpty {
        return (u,v,true)
    }
    
    return (u,v,false)
}

let s = "()))((()"
print(solution(s))
print(solution2(s))

//print(splitToUV("))(("))
//let word = "))(("
//let tempindex = 3
//let splitIndex = word.index(word.startIndex, offsetBy: tempindex+1)
//        let  u = String(word[word.startIndex..<splitIndex])
//      let    v = String(word[splitIndex..<word.endIndex])
//print(u)
//print(v)
