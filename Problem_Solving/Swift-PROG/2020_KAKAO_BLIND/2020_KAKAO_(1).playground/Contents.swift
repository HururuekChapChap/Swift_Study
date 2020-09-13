import UIKit

func solution(_ new_id:String) -> String {
    
    var lowercase = new_id.lowercased().filter { (char) -> Bool in
        
        if char.isLetter || char.isNumber || char == "-" || char == "_" || char == "."{
            return true
        }
            return false
    }.map { (char) -> String in
        return String(char)
    }
    
//    print(lowercase)
    
    var index = 0
    var dotCnt = 0
    var deleteIndex = 0
    while index < lowercase.count {
        
        
        if lowercase[index] == "."{
            
            if dotCnt == 0 {
                deleteIndex = index
            }
            
            dotCnt += 1
        }
        else{
            
            if dotCnt > 1 {
//                print(index , dotCnt)
                
                for _ in 0..<dotCnt{
                lowercase.remove(at: deleteIndex)
                }
                
                lowercase.insert(".", at: deleteIndex)
//                print(lowercase)
            }
            
            index -= dotCnt
            dotCnt = 0

        }
        
        index += 1
    }
    
//    print(dotCnt)
    
    if dotCnt > 1 {
//        print(index , dotCnt)
        
        for _ in 0..<dotCnt{
        lowercase.remove(at: deleteIndex)
        }
        
        lowercase.insert(".", at: deleteIndex)
//        print(lowercase)
    }
    
//    print("결과 : ", lowercase)
    
    if !lowercase.isEmpty && lowercase[0] == "."{
        lowercase.remove(at: 0)
    }
    if  lowercase.count > 1 && lowercase[lowercase.count - 1] == "."{
        lowercase.remove(at: lowercase.count - 1)
    }
    
//    print(lowercase)
    
    if lowercase.isEmpty{
        lowercase.append("a")
    }
    
    if lowercase.count >= 16{
        
        lowercase = Array(lowercase[0...14])
        
        if  lowercase.count > 1 && lowercase[lowercase.count - 1] == "."{
            lowercase.remove(at: lowercase.count - 1)
        }
        
    }
    
//    print(lowercase)
    
    if lowercase.count <= 2{
        let lastword = lowercase.last!
        var cnt = lowercase.count
        
        while cnt < 3{
            
            lowercase.append(lastword)
            cnt += 1
        }
        
    }
    
    
    return lowercase.joined()
}

let new_id = "abcdefghijklmn.p"

print(solution(new_id))
