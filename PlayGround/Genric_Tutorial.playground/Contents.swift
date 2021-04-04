import UIKit

//https://docs.swift.org/swift-book/LanguageGuide/Generics.html
//낼은 블로그에 정의해서 올리기

//Generic Type Function - Swap
func swap<Element>(item1 : inout Element , item2 : inout Element){
    let temp = item1
    item1 = item2
    item1 = temp
}

var A : String = "ChapChap"
var B : String = "Hururuek"

print("\(A) , \(B)")

swap(&A, &B)

print("\(A) , \(B)")


//Generic Type Stack

struct Stack<Element> {
    var items : [Element] = []
    mutating func push(_ item : Element){
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var stack : Stack<String> = Stack<String>()
stack.push("Hello")
stack.push("World")
print(stack.items)
stack.pop()

extension Stack{
    
    var topItem : Element?{
        return items.isEmpty ? nil : items.last
    }
    
}

print(stack.topItem ?? "비었습니다")

//Genric Type with Type Constraint - Protocol
func compareFunction< Element : Equatable>(item : Element , list : [Element]) -> Int? {
    
    for (index , value) in list.enumerated(){
        
        if value == item {
            return index
        }
        
    }
    
    return nil
}

let list : [Int] = [3,1,4,5,1,5,1,0,9,5]

print(compareFunction(item: 1, list: list) ?? "없습니다")

//Generic Type with Type Constraint - Class

class Animal {
    
    var name : String
    
    init(name : String){
        self.name = name
    }
    
}

class Person : Animal {
    
    var age : Int
    
    init(name : String , age : Int){
        
        self.age = age
        
        super.init(name: name)
    }
    
}

func printName <Element : Animal>(input : Element){
    
    if let item = input as? Person {
        print("name : \(item.name) age : \(item.age)")
    }
    else{
        print("name : \(input.name)")
    }
    
}


let animal : Person = Person(name: "ChapChap", age: 27)
printName(input: animal)


protocol Container {
    
    associatedtype Item
    mutating func append(_ item : Item)
    var count : Int {get}
    
}

// Associated Types with typealias

struct IntStack : Container {
    
    var items : [Int] = []
    
    mutating func push(_ item : Int){
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias Item = Int
    
    mutating func append(_ item: Int) {
        self.push(item)
    }
    
    var count: Int{
        return items.count
    }

}

// Associated Types without typealias

struct Stacks<Element> : Container {

    var items = [Element]()
    
    mutating func push(_ item : Element){
        items.append(item)
    }
    
    mutating func pop() -> Element{
        return items.removeLast()
    }
    
    mutating func append(_ item: Element) {
        self.push(item)
    }
    
    var count: Int{
        return items.count
    }
    
}

//Generic Wiht Where

protocol Rules {
    
    associatedtype Item
    
    var list : [Item] {get set}
    
    var count : Int {get}
    
}

func allItemsMatch<C1: Rules, C2: Rules>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item : Equatable {

        // Check that both containers contain the same number of items.
        if someContainer.count != anotherContainer.count {
            return false
        }

        // Check each pair of items to see if they're equivalent.
        for i in 0..<someContainer.count {
            if someContainer.list[i] != anotherContainer.list[i] {
                return false
            }
        }

        // All items match, so return true.
        return true
}


class classWithInt : Rules {
    var list: [Int]
    
    var count: Int
    
    typealias Item = Int
    
    init(items : [Int]){
        self.list = items
        self.count = self.list.count
    }
    
}


class classWithString : Rules {
    var list: [String]
    
    var count: Int
    
    typealias Item = String
    
    init(items : [String]){
        self.list = items
        self.count = self.list.count
    }
    
}


let test1_Int = classWithInt(items: [1,2,3,4,5])
let test2_Int = classWithInt(items: [1,2,3,4,5])

allItemsMatch(test1_Int, test2_Int)

let test1_String = classWithString(items: ["A","B","C","D"])

//allItemsMatch(test1_Int, test1_String)

func findDiff<Element1 : Rules , Element2 : Rules>(input1 : Element1, input2 : Element2) -> String where Element1.Item == Element2.Item, Element1.Item : Equatable {
    
    if input1.count != input2.count{
        return "Wrong"
    }
    
    for (index, item) in input1.list.enumerated(){
        
        if item != input1.list[index]{
            return "find Diff : \(item) in \(index)"
        }
        
    }
    
    return "All Same"
}

findDiff(input1: test1_Int, input2: test2_Int)

//Extensions with a Generic Where Clause - 확장 된 부분에 where를 넣는다면 그 밑에 정의된 함수들을 사용할 때 where가 적용된 놈들만 사용 할 수 있다.

extension Stacks where Element : Equatable {
    
    func isTop(_ item: Element) -> Bool {
           guard let topItem = items.last else {
               return false
           }
           return topItem == item
    }
    
}

//조건을 넣어줄 때 재료 : 조건
extension Container where Item: Equatable {
    func startsWith(_ item: Item) -> Bool {
        return count >= 1
    }
}

//Protocol일 경우에는 associatedtype에 대해서 제한을 줄 수 있다.
extension Container where Item == Int{
    
    func average() -> Double {
          return Double(count) / Double(2)
       }
    
}



//Contextual Where Clauses - 특정 함수에 해당하는 내용에 where의 제한을 넣어줄 수 있고 이것을 extension으로 나눠 줄 수도 있다.
