import UIKit

let plus = { (a : Int , b : Int ) -> Int in
    
    return a + b
}

let minus = { (a : Int, b : Int ) -> Int in
    
    if a > b {
        return a - b
    }
    
    return b - a
    
}

let muliply = { (a: Int, b: Int) -> Int in
    
    return a * b
    
}

func calculate(a : Int , b : Int , function : (Int, Int) -> Int) -> Int {
    return function(a,b)
}

print(calculate(a: 1, b: 2, function: plus))

print(calculate(a: 1, b: 2, function: minus))

print(calculate(a: 1, b: 2){ a,b in
    return a * b
})

func getResult(handler : @escaping (Int,Int) ->Void ){
        
    handler(1,2)
    print("Escaping Handelr")
    
}

getResult { (result1, result2) -> Void in
    print("결과 반환 \(result1), \(result2)")
}

func printClosure(name : String, nameToPrint : ()->()){
    
    print(name)
    nameToPrint()
    print("What?")
}

printClosure(name: "steven") {
    print("well done")
}


func printNumber(element : Int, elementToReturn : (Int) -> (Int) ){
    
    print(element)
    //이런걸 컴플리트 핸들러라고 부른다.
    let number = elementToReturn(element)
    print(number)
}

printNumber(element: 5) { (element) -> (Int) in
    return element * element
}

var tapHandler : ((String)->())?

tapHandler = { string in
    
    print(string)
    
}

func callTapHandler(){
    tapHandler?("Hello")
}

//callTapHandler()

//autoclosure는 내용물을 좀더 깨끗하게 할때, 그런데 반환인자가 없어야 한다.
func autoClosure(name : String , someClosure : @autoclosure ()->()){
    
    print(name)
    
    someClosure()
}

//autoClosure(name: "Hello", someClosure: (print("Taesoo")))

func dispatchQueue(number : Int , escapingHandler : @escaping (Int) -> () , completHandler : (Int)->(Int) ) -> Int {
    
    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
        print("Start number")
        var temp : Int = 1
        for _ in 0..<100{
            temp += 1
        }
         print("let go escaping handler : \(temp)")
        escapingHandler(temp)
    }
    
    let completHanderNumber = completHandler(number)
    
    return completHanderNumber * 2
}

let result  = dispatchQueue(number: 5, escapingHandler: { (temp) in
    print("escaping handler temp result :\(temp)")
}) { (result) -> (Int) in
    
    print("complete Handler : \(result * 2)")
    return result * 2
}

//print("last ressult : \(result)")




    



