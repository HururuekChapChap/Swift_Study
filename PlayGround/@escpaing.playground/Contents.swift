import UIKit

let closure = { (name : String) -> Void in
    print(name)
}

func closureFunction(closure : (String) -> Void , name : String){
    print("HELLO")
    closure(name)
}

//자동완성을 하면 내가 클로저에 들어가는 내용을 재정의 할 수 있다.
//반면 재정의를 해줬을 경우에 함수 내부에서 closure가 사용된다면 다시 클로저를 불러줘야한다.

//closureFunction(closure: { (name) in
//  closure(name)
//  closure("again")
//}, name: "Tae")

//정의된 함수를 넣을 때는 이렇게 된다.

//closureFunction(closure: closure, name: "hahaha")

//none이스케이핑 함수를 저장하는 변수
var noneEscapingHandlers : [(Int)->()] = []

//비동기식 제어방법
let handler = { () -> () in
    var sum = 0
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        
           for i in 0..<1000{
                  sum += i
              }
            
        print(sum)
        
       }
   
    
}

//noneEscaping에서는 비동기식 클로저인 handler를 다룰 수 없다.
func noneEscaping(handler : ()->()){
    print("Start")
    
    //handler

    print("End")
}

noneEscaping(handler: handler)

print("========= escaping ==========")

//이스케이핑 함수를 저장하는 변수
var escapingHandlers : [()->()] = []

//@escaping을 할 경우 비동기식 클로저를 수행함을 의미하고
func Escaping(handler : @escaping () -> ()){
    print("Start")
    
    //이렇게 클로저 배열에 저장할 수가 있다.
    escapingHandlers.append(handler)
    
    print("End")
}

Escaping(handler: handler)
//그리고 클로저를 실행시킬 때는 이렇게 배열을 실행시켜 주면 된다.
escapingHandlers[0]()

func makeIncrement(_ number : Int) -> (()->(Int)) {
    
    var runningTotal : Int = 0
    
    func increseFunc() -> Int {
    
        runningTotal += number
        
        return runningTotal
        
    }
    
    return increseFunc
}

func whatisThis() -> Int{

    return 3
}

//함수 자체를 반환하게 되는 것이고
let A = whatisThis

//그 값을 반환 하는 것이다.
let B = whatisThis()

print(A)
print(B)

//increseFunc가 incrementByTwo에 저장이 됐다.
//값이 저장이 됐다는 것은 runningTotal의 주소와 number가 모두 참조값으로 저장이 된 것이다.
let incrementByTwo = makeIncrement(2)

//따라서 여기서 실행 시켜주면 runningTotal에 number가 저장이 되면서 반환해준다.
//그런데 incrementByTwo가 메모리에서 해제 된 것이 아니기 때문에
//runningTotal은 값이 더 해진 체로 남아 있게 된다.
let first = incrementByTwo()
print(first)
let second = incrementByTwo()
print(second)


typealias voidvoidClosure = () -> Void

let firstClosure : voidvoidClosure = {
    print("Closure A")
}

let secondClosure : voidvoidClosure = {
    print("Closure B")
}

//이렇게 내제된 클로저를 반환하는 것은 none 이스케이핑 클로저를 사용해도 된다.
func returnOneOfClosure(_ first : voidvoidClosure,_ secode : voidvoidClosure ,_ type : Bool) -> voidvoidClosure {
    
    let AClosure : voidvoidClosure = {
        print("Closure A")
    }

    let BClosure : voidvoidClosure = {
        print("Closure B")
    }
    
    return type ? AClosure : BClosure
}

//이렇게 first와 second 라는 매개변수로 받은 클로저를 반환 하기 위해서는 이스케이핑을 사용 해야 한다.
func returnOneOfClosure2(_ first : @escaping voidvoidClosure,_ second : @escaping voidvoidClosure ,_ type : Bool) -> voidvoidClosure {
    
    return type ? first : second
}

let returnClosure = returnOneOfClosure2(firstClosure, secondClosure, true)

print("function : " , returnClosure)
print("value : ",returnClosure())



func changeMyName(increase : Int) ->((String)->(String)) {
    
    var number : Int = 0
    
    var myName : String = ""
    
    func makeName(name : String) -> String {
        
        if number % 2 == 0 {
            myName = "I'm \(number) and \(name)"
        }
        else{
            myName = "I'm oddNumber"
        }
        
        number += increase
        
        return myName
        
    }
    
    
    return makeName
    
}

let changeNameFunction = changeMyName(increase: 3)

let Aname = changeNameFunction("Hururuek")
let Bname = changeNameFunction("ChapChap")
let Cname = changeNameFunction("Blog")

