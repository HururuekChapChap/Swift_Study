import UIKit

func solution(_ dartResult:String) -> Int {
    
    var array : [Int] = Array(repeating: 0, count: 3)
    
    let list = returnStringByRex(pattern: "[0-9]+[a-z][*#]?", word: dartResult)
    
    var current = 0
    
    for element in list {

        let score = returnStringByRex(pattern: "[0-9]+", word: element)

        let bonus = returnStringByRex(pattern: "[a-z]", word: element)

        let option = returnStringByRex(pattern: "[*#]", word: element)
        
        var total = 0
        
//        print(score.first! , bonus.first! , option.first ?? nil)
        
        switch bonus.first {
        case "S":
          total = Int(score.first!)!
        case "D":
          total = Int(pow(Double(score.first!)! , 2))
        case "T":
          total = Int(pow(Double(score.first!)! , 3))
        default:
            print("Not happen")
        }
        
        if option.count == 1 {
            
            if current == 0 && option.first! == "*" {
                total = total * 2
            }
            else if current > 0 && option.first! == "*" {
                total = total * 2
                array[current - 1] = array[current - 1] * 2
            }
            else{
                total = total * -1
            }
            
        }
        
        array[current] = total
        current += 1
    }

    return array.reduce(0, +)
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

let dartResult = "1S2D*0T"

//print(solution(dartResult))

//^은 문자열이 시작할 때 그 문자로 시작하는지 안하는지 체크하는 것이다.

print(returnStringByRex(pattern: "^Hello", word: "Hello evey Body"))
print(returnStringByRex(pattern: "^Hello", word: "Hell evey Body"))

//$는 문자열이 끝날 때 그 문자로 끝나는건지 확인하는 것이다.

print(returnStringByRex(pattern: "Hello$", word: "Hello evey Body"))
print(returnStringByRex(pattern: "Hello$", word: "Hello evey Body Hello"))

//... 이것은 갯수 만큼 보여주는 것 입니다. 다른 표현으로 .{3} 이렇게 가능합니다.

print(returnStringByRex(pattern: "...", word: "Hello evey Body"))
print(returnStringByRex(pattern: ".{3}", word: "Hello evey Body"))

//[]은 한 문자만 의미한다. 따라서 a-z 의 한 문자를 의미한다. [^]은 그외의 것을 의미한다.
print(returnStringByRex(pattern: "[a-h]", word: "Hello evey Body"))
print(returnStringByRex(pattern: "[^a-h]", word: "Hello evey Body"))

//*은 e* 라고 할때, e가 연속적으로 0개 이상 여러개 까지 뽑아온다. 하지만 e가 아닌 위치일 경우에는 공백으로 만든다.
print(returnStringByRex(pattern: "e*", word: "Hello evey Body"))
print(returnStringByRex(pattern: "e*l", word: "Hello evey Body"))
//+은 e+ 라고 할때, e가 연속적으로 한개 이상 여러개 까지 뽑아온다. 따라서 존재하지 않다면 뽑아오지 않는다.
print(returnStringByRex(pattern: "e+", word: "Hello evey Body"))
print(returnStringByRex(pattern: "e+v", word: "Hello evey Body"))
//?는 e? 라고 할때, e가 없으면 공백으로 있으면 그 문자 하나만 가져온다.
print(returnStringByRex(pattern: "e?", word: "Hello evey Body"))
print(returnStringByRex(pattern: "e?l", word: "Hello evey Body"))
//그런데 만약 e*K 나 e+k 등 하나의 문자만 사용 된다면 그 조건만 되는 것을 반환한다.

print(returnStringByRex(pattern: "(Hello|evey)", word: "Hello evey Body"))
print(returnStringByRex(pattern: "([h]|[b])", word: "Hello evey Body"))


//do {
//     let regex = try NSRegularExpression(pattern: "[0-9]*[a-z][*#]?", options: .caseInsensitive)
//
//     let result = regex.matches(in: dartResult, options: [], range: NSRange(location: 0, length: dartResult.count))
//
//     let answer = result.map { (element) -> String in
//         let range = Range(element.range, in: dartResult)!
//         return String(dartResult[range])
//     }
//
//     print(answer)
// } catch let error {
//     print(error.localizedDescription)
// }



//split(whereSeparator : ) 는 클로저 형식으로 여러개의 문자를 기준으로 나눠 준다.
//즉 아래 것을 본다면 문자 나 # 또는 *을 제외 한 것을 반환 해준다.
let numberList = dartResult.split(whereSeparator: {$0.isLetter || $0 == "#" || $0 == "*"})

print(numberList)

let letterList = dartResult.split(whereSeparator: {$0.isNumber})

print(letterList)

for element in zip(numberList, letterList){
    print(element)
}
