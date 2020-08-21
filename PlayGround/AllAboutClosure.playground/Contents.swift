import UIKit

//Closure Expression

let addTwoNumber : (Int, Int) -> (Int) = { (one : Int, two : Int) -> (Int) in
    print("덧셈")
    return one + two
}

addTwoNumber(1,3)

let timesTwoNumber = { (one :Int, two :Int) -> (Int) in
    print("곱셈")
    return one * two
}

timesTwoNumber(1,3)

let minusTwoNumber : (Int, Int) -> (Int) = { one, two in
    print("뺄셈")
    return max(one,two) - min(one,two)
}

minusTwoNumber(1,3)

let diviedTwoNumber : (Int, Int) -> (Int) = {
    print("나눗셈")
    return max($0, $1) / min($0,$1)
}

diviedTwoNumber(10,5)

//Complete Handler - noneEscaping Closure
func mathFunction(one : Int , two : Int , formula : (Int,Int) -> (Int)) -> Int{
    let result = formula(one,two)
    print("결과를 받았다")
    return result + 10
}

print(mathFunction(one: 10, two: 5, formula: addTwoNumber))

print(mathFunction(one: 10, two: 5, formula: { (one, two) -> (Int) in
    return (one * two) * 1000
}))





// Variable Closure and Complete Handler with noneEscaping

var getString : (String) -> (String)

getString = { (sitemap) -> String in
    
    return "\(sitemap) HurueruekChapChap"
}

func makeBlogName(sitemap : String , completeHandler : (String) -> (String)){
    print(completeHandler(sitemap))
}

makeBlogName(sitemap: "티스토리", completeHandler: getString)


let string = "http://m.site.naver.com/0qSgL"

print(string.hasPrefix("http://"))

// escaping Closure

func escapingFunc(number :Int , escapingHandler : @escaping (Int) -> ()) -> Int{
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        
        print("escaping Start")
        escapingHandler(number)
    }
    
    return number
    
}
//
//let result = escapingFunc(number: 200) { (number) -> () in
//                print(number + 1000)
//            }
//print("escaping 결과 : \(result)")


struct Info{
    let name : String
    let id : Int
    let major : String
    
    func printFullInfo() -> String{
        return "이름 : \(name) 학번 : \(id) 전공 : \(major)"
    }
}

enum APIError : String{
    case wifiError = "와이파이 에러"
    case httpError = "통신 에러"
    case justError = "그냥 에러 "
}

enum APIResult<SuccessType> {
    
    case success(SuccessType)
    case failure(APIError)
    
    func PrintCase() -> Any {
    
        switch self{
            
        case .success(let message):
            return message
        case .failure(let message):
            return message.rawValue
        }
        
    }
}


func connection( status : Int , student : Info , escapingHandler : @escaping (APIResult<Info>) -> ()){
    
    let goodStatus = 200..<300
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("Thread 시작 ")
        if status == 300 {
            escapingHandler(.failure(.wifiError))
            return
        }
        
        if !goodStatus.contains(status) {
            escapingHandler(.failure(.httpError))
            return
        }
        
        if status == 250 {
            escapingHandler(.failure(.justError))
            return
        }
        
        escapingHandler(.success(student))
    }
    
    print("connection 함수 끝")
    
}

let student1 = Info(name: "ChapChap", id: 12345, major: "computer_Science")


//let test = APIResult<String>.failure(.httpError)
//
//let test2 = APIResult<Info>.success(student1)
//
//if let result = test2.PrintCase() as? Info {
//result.printFullInfo()
//}


//connection(status: 200, student: student1) { (result) in
//
//    if let studentInfo = result.PrintCase() as? Info{
//       print( studentInfo.printFullInfo() )
//    }
//    else{
//        print( result.PrintCase() )
//    }
//
//}

//Function Types as Return Types & Nested Functions
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        
    func stepForward(_ input: Int) -> Int {
        
        return input + 1
    }
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }

    
    return backward ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue < 0)

moveNearerToZero(currentValue)
