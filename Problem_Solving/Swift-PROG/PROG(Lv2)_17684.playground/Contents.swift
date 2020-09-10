import UIKit

//39:07
func solution(_ msg:String) -> [Int] {
    
    var dict : [String : Int] = [:]
    
    for start in 0..<26{
        
        let word = String( UnicodeScalar(65 + start)! )
        
        dict[word] = start + 1
    }
    
    let msgList = Array(msg).map { (char) -> String in
        return String(char)
    }
    
    var answer : [Int] = []
    var index = 0
    
    while index < msgList.count{
        
        var searchString = ""
        var inputString = ""
        var cnt = 0
        
        for temp in index..<msgList.count {
            
            inputString += msgList[temp]

            if dict[inputString] == nil{
                
//                print(inputString, searchString)
                dict[inputString] = dict.count + 1
                
                //출력
                answer.append(dict[searchString]!)
                
                break
            }
            
            searchString += msgList[temp]
            cnt += 1
            
            //마지막 위치
            if temp == msgList.count - 1{
                answer.append(dict[searchString]!)
            }
            
        }
        
        index += cnt
//        print(index , msgList.count)
        
    }
    
//    print(answer)
    
    return answer
}

let msg = "ABABABABABABABAB"

//solution(msg)

var dic = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".reduce(into: [String: Int](), { d, s in
       d[String(s)] = d.count+1
   })

print(dic)

let result = msg.reduce(into: [Character]() ) { (stack, char) in
    return stack.append(char)
}

print(result)

