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
