import Foundation

class test{
    
    typealias inputType = (String)->(Void)
    
    var task : (inputType) -> Void
    
    init(task : @escaping (inputType) -> Void ){
        self.task = task
        
//        let test : inputType = { (stringValue) -> () in
//            print(stringValue)
//        }
//
//        task(test)
        
        print("Init finished")
    }
    
    func returnResult(input : inputType){
        
        print("Call task function")
        
        task(input)
    }
    
}

func main(){
    
    let result = test(task:
        { (task) in
            print("test start")
            task("Hururuek")
            print("test finished")
        }
        
    )
    
    result.returnResult { (data) in
        print(data)
    }
    
}

main()


class test2{
    
    var handler : ((String) -> Void)?
    
    init(input : ((String) -> Void)?){
        self.handler = input
        
        print("Hello")
    }
    
}

func main2(){
    
    let result = test2 { (returnValue) in
        print(returnValue)
    }
    
    result.handler = { value in

        print(value)

    }
    
    result.handler?("world")
    
}

//main2()


class test3 {
    
    typealias inputType = (String) -> Void
    
    var task : (inputType) -> Void
    
    init(){
        self.task = { data in
            print("test start")
            data("ChapChap")
            print("test finished")
        }
        
        print("Init finished")
    }
    
    func returnResult(input : inputType){
        print("Okey start")
        
//        let input : inputType = { data in
//            print("\(data), Hello world")
//
//        }
        
        task(input)
    }
    
    func returnResult(){
        print("Okey start")
        
        let input : inputType = { data in
            print("\(data), Hello world")
        }
        
        input("Chap")
        
//        task(input)
    }
    
    
    
}

func main3(){
    
    let result = test3()
    
//    result.returnResult(input: { data in
//        print("\(data), Hello world")
//    })
    
    result.returnResult()
    
}

//main3()

func mistake(closure : () -> ()){
    //(1)
    closure()
}

mistake {
    //(2)
    print("Hello world")
}
