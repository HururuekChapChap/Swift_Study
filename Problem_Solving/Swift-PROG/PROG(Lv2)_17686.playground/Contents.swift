import UIKit


//28:56
func solution(_ files:[String]) -> [String] {
    
    var stack : [(head : String , number : Int , tail : String, index : Int)] = []
    
    for (index , element ) in files.enumerated(){
        
        let HEAD = returnStringByRex(pattern: "[^(0-9)]+", word: element).first!
        let NUMBER = returnStringByRex(pattern: "[0-9][0-9]?[0-9]?[0-9]?[0-9]?", word: element).first!
        let TAIL = element.replacingOccurrences(of: HEAD + NUMBER, with: "")
//        print(HEAD)
//        print(NUMBER)
//        print(TAIL)
        stack.append((HEAD, Int(NUMBER)!, TAIL , index))
    }
    
    stack = stack.sorted(by: { (element1, element2) -> Bool in
        
        let element1_head = element1.head.lowercased()
        let element2_head = element2.head.lowercased()
        
        if element1_head == element2_head {
            
            if element1.number == element2.number {
                return element1.index < element2.index
            }
            
            return element1.number < element2.number
            
        }
        
        
        return element1_head < element2_head
    })
    
    var answer : [String] = []
    
    for element in stack {
        
        let index = element.index
        
        answer.append(files[index])
    }
    
    return answer
}

func returnStringByRex(pattern : String , word : String) -> [String] {
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
        
        let result = regex.matches(in: word, options: [], range: NSRange(location: 0, length: word.count))
        
        let rexStrings = result.map { (element) -> String in
            
            let range = Range(element.range, in: word)!
            
            return String(word[range])
            
        }
        
        return rexStrings
    } catch let error {
        print(error.localizedDescription)
    }
    
    return []
    
}

let files = ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG", "F-15","img1...png"]

//print(solution(files))



let test = "img1...png"

let numb = returnStringByRex(pattern: "[0-9][0-9]?[0-9]?[0-9]?[0-9]?", word: test)

print(numb)
