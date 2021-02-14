import UIKit

struct Stack<PlaceHodler_T>{
    var items : [PlaceHodler_T] = []
    
    mutating func push(_ item : PlaceHodler_T){
        items.append(item)
    }
    
    mutating func pop() -> PlaceHodler_T {
        return items.removeLast()
    }
}

var stringStack : Stack<String> = Stack<String>()
stringStack.items.count

stringStack.push("Hello")
stringStack.push("World")

stringStack.pop()
stringStack.pop()

var intStack : Stack<Int> = Stack<Int>()
intStack.push(10)
intStack.push(20)

intStack.pop()

// Extension 할 때는 <PlacHolder_T>가 필요 없다.
extension Stack{
    
    var topElement : PlaceHodler_T? {
        return self.items.last
    }
    
}

intStack.topElement
stringStack.topElement

//타입 제약

protocol Name {
    var first : String {get set}
    var last : String {get set}
    
    var fullName : String {get}
    
}

// <제너릭이름 : 준수해야할 프로토콜 or 클래스>
struct Infomations<PlaceHolder : Name>{
    
    var items : [PlaceHolder] = []
    
    mutating func push(item : PlaceHolder) {
        items.append(item)
    }
    
    mutating func pop() -> PlaceHolder {
        return items.removeLast()
    }
    
}

class Korean : Name{
    var first: String
    
    var last: String
    
    var fullName: String {
        return self.first + self.last
    }
    
    init(first : String , last : String){
        self.first = first
        self.last = last
    }
    
}

class Test {
    var name : String = "Ha"
}

let korean_1 = Korean(first: "짭짭", last: "후르륵")
let korean_2 = Korean(first: "철수", last: "김")
let test = Test()

var KoreanStack : Infomations<Korean> = Infomations<Korean>()
//var testStack : Infomations<Test> = Infomations<Test>() //Test는 Name 프로토콜을 준수하지 않아서 Infomation 제너릭에 들어 갈 수가 없다.

KoreanStack.push(item: korean_1)
KoreanStack.pop().fullName

// 제너릭 클래스 타입 넣는 방법
// 이렇게 프로토콜 뿐만 아니라 클래스 까지 넣을 수 있다.
struct InfomationClass<PlaceHolder : Korean>{
    
    var items : [PlaceHolder] = []
    
    mutating func push(item : PlaceHolder) {
        items.append(item)
    }
    
    mutating func pop() -> PlaceHolder {
        return items.removeLast()
    }
    
}

let korean_3 = Korean(first: "짭짭", last: "후르륵")
var KoreanStack2 : InfomationClass<Korean> = InfomationClass<Korean>()

// 다양한 제약을 추가하는 방법 - 인스턴스에.
struct InfomationMulti<T : Korean>: Name {
    
    var first: String
    
    var last: String
    
    var fullName: String
    
    // 다양한 제약을 추가하는 방법 - 함수에
    mutating func changeFirstName<T>(input : T) where T : Name {
        self.first = input.first
    }
    
}
