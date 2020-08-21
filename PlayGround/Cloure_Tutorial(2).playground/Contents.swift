import UIKit

func getNumber(to : Int, handler : (Int) -> ()){
    
    var sum = 0
    
    for i in 0..<to{
        sum += i
    }
   print("getNumber Result \(sum)")
  handler(sum)
  handler(sum)
}
//
//getNumber(to: 1000) { (sum) in
//    print(sum)
//}

func getPlusNumber(to : Int, handler : @escaping (Int) -> () ){
    
    print("Start")
    var sum = 0
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        
        for i in 0..<to{
            sum += i
        }
        
        handler(sum)
        
    }
    
    handler(sum)
    print("END")
    
    
}


//getPlusNumber(to: 1000) { (sum) in
//    print(sum)
//}

let muliplyHandler = { (number : Int) -> () in
    
    var sum = 0
    print("\(number) Start \(sum)")
    for i in 0..<number {
        sum += i
    }
    
    print(sum)
    
}

//getNumber(to: 50, handler: muliplyHandler)


muliplyHandler(50)

//클로저는 또다른 함수 인데, 전달 해줄 수 있는 함수 있다.
//그러니깐 단순한 클로저를 실행 시키면 그 클로저만 수행이 된다.
//그러나 만약 함수랑 같이 쓰인 다면
//함수에서 수행한 결과를 클로저에 전달 할 수 있다.
//따라서 getNumber에서는 결과가 두번이나오고 muliplyHandler는 한번만 수행이 되는 것이다.
//즉 함수 안에 다시 함수를 사용해줬다고 생각하면 된다.
//그런데 이렇게 함수를 수행 해주면 결과가 전달 되기 때문에
//자동설정으로 해주면 우리가 정의해준 방법으로 결과가 전달 되는 것이다.

