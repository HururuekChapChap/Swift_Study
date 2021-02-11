import UIKit

class Coffee{
    let name : String
    let shot : Int
    
    var description : String{
        get{
            return "\(shot) shot(s) \(name)"
        }
    }
    
    func printName(){
        print(name)
    }
    
    init(shot : Int){
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte : Coffee {
    var flavor : String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    func printFlavor(){
        print(flavor)
    }
    
    init(flavor : String, shot : Int){
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano : Coffee{
    
    let iced : Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    func printIcedState(){
        print(iced)
    }
    
    init(shot : Int , iced : Bool){
        self.iced = iced
        super.init(shot: shot)
    }
    
}


//데이터 타입 확인 IS

let coffee : Coffee = Coffee(shot: 1)
print(coffee.description)
print(coffee is Coffee)
print(coffee is Americano)
print(coffee is Latte)

let americano : Americano = Americano(shot: 2, iced: false)
print(americano.description)

let latte : Latte = Latte(flavor: "green tea", shot: 3)
print(latte.description)

print(americano is Coffee)
print(americano is Latte)
print(latte is Coffee)
print(latte is Americano)

//클래스 인스턴스(AnyObject)를 판별을 IS로 판별하는 방법
func checkType(of item : AnyObject){
    
    if item is Latte{
        print("item is latte")
    }
    else if item is Americano{
        print("item is Americano")
    }
    else if item is Coffee{
        print("item is Coffee")
    }
    
}

checkType(of: latte) // 이렇게 AnyObject이기 때문에 IS로 판별해준다. item is latte
checkType(of: americano) // item is Americano


//Type Casting

//타입 캐스팅은 부모에서 아래로 다운 캐스팅을 의미한다. 따라서
//부모에서 자식으로 판단하는 것이 아니라 자식에서 부모를 판단한다면 오류가 발생한다.
//또한 서로 관계없는 것에서도 마찮가지 이다.

//Latte는 Coffee의 자식이다. 따라서 Latte는 Coffee처럼 위장할 수 있다.
let camouflageType : Coffee = Latte(flavor: "Pink", shot: 3)


//camouflageType은 Coffee인데 원래 태생이 Latte이기 때문에 Latte로 타입 변경을 해준다.
if let downCasting = camouflageType as? Latte{
    downCasting.printFlavor()
}
else{
    print("downCasting fail : " , camouflageType.description)
}

//반면에 Americano도 Coffee 밑에 있기 때문에 이렇게 타입 케스팅이 되지만 결과는 else 문으로 빠지게 된다.
if let downCasting = camouflageType as? Americano{
    downCasting.printIcedState()
}
else{
    print("downCasting fail : " , camouflageType.description)
}

class temp {}

//이렇게 관계가 없는 것은 오류가 나온다.
if let downCasting = camouflageType as? temp{
    
}

if let downCasting = coffee as? Americano {
    print(downCasting.printIcedState())
}else{
    print("downCasting fail : " , coffee.description)
}

if let downCasting = coffee as? Latte {
    print(downCasting.printFlavor())
}else{
    print("downCasting fail : " , coffee.description)
}


//같은 타입일 경우에는 as? 가 아니라 보통 as로 해줘야 한다.
let downCasting = coffee as Coffee
downCasting.printName()

//부모 클래스 일 경우에도 as? 가 아니라 보통 as로 해준다.
let upCasting = latte as Coffee


//DownCasting function

func castTypeToAppropriate(item : Any){
    
    if let castedItem : Latte = item as? Latte{
        castedItem.printFlavor()
    }
    else if let castedItem : Americano = item as? Americano{
        castedItem.printIcedState()
    }
    else if let castedItem : Coffee = item as? Coffee{
        castedItem.printName()
    }
    else{
        print("Unkown Type")
    }
    
}

castTypeToAppropriate(item: coffee)
castTypeToAppropriate(item: latte)
castTypeToAppropriate(item: camouflageType) // camouflageType은 Coffee인덷 Latte로도 typeCasting이 되기 때문에 Pink라는 결과가 나왔다.


//Meta Type

protocol SomeProtocol{}
class SomeClass : SomeProtocol{}

//Int.Type은 Int의 타입을 저장하는 것이다.
let intType : Int.Type = Int.self
let stringType : String.Type = String.self
let classType : SomeClass.Type = SomeClass.self // 이렇게 하면 SomeClass 타입이 들어가게 된다.
let protocolProtocol : SomeProtocol.Protocol = SomeProtocol.self // Protocol은 Type이 아니라 Protocol이다.

var someTypee : Any.Type // 아무런 타입이 들어 갈 수가 있다.

someTypee = intType
print(someTypee) //someType의 Type은? Int 타입이다.

someTypee = stringType
print(someTypee) //someType의 Type은? String 타입이다.

someTypee = classType
print(someTypee) //someType의 Type은? SomeClass 타입이다.

someTypee = protocolProtocol // 프로토콜 이여도 Type으로 들어 갈 수가 있다.
print(someTypee) //someType의 Type은? SomeProtocol 타입이다.

print("StringValue".self) // 값 다음에 .self를 해주면 값이 나오고, 타입 뒤에 .self를 해주면 타입이 나오게 된다.






