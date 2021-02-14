import UIKit


protocol extensionProtocol{
    var name : String {get set}
}

extension extensionProtocol{
    
    func function(){
        hide()
    }
    
    private func hide(){
        print("Hello")
    }
    
}


class Test : extensionProtocol{
    var name: String = "name is test"
    
    func function() {
        print("\(self.name) Hello world")
    }

    
}

let test = Test()

test.function()



protocol AttackerProtocol{
    
    var attacker : AttackerProtocol? {get set}
    
    func attack()
    
    func attackWay()
    
}

protocol DefenceProtocol{
    
    var name : String {get set}
    
    var defencer : DefenceProtocol? {get set}
    
    func defence(instance : DefenceProtocol, attacker : AttackerProtocol & DefenceProtocol)
    
    func defecneWay(attacker : AttackerProtocol & DefenceProtocol)
    
}

class Player_A : AttackerProtocol , DefenceProtocol {
    
    //AttackerProtocol
    var attacker: AttackerProtocol?
    
    func attack() {
        guard let att = self.attacker else {
            print("\(self.name) attacker is nil")
            return}
        
        att.attackWay()
    }
    
    func attackWay() {
        print("\(self.name) use Player_A Attack")
    }
    
    //DefenceProtocol
    
    var name: String
    
    var defencer: DefenceProtocol?
    
    func defence(instance : DefenceProtocol, attacker : AttackerProtocol & DefenceProtocol) {
        guard let defence = self.defencer else {
            instance.defecneWay(attacker: attacker)
            return
        }
        
        defence.defecneWay(attacker: attacker)
    }
    
    func defecneWay(attacker : AttackerProtocol & DefenceProtocol) {
        print("\(self.name) defence \(attacker.name) with Player_A Style")
    }
    
    init(name : String){
        self.name = name
        self.attacker = self
        self.defencer = self
    }

    
}

class Player_B : AttackerProtocol , DefenceProtocol {
    
    //AttackerProtocol
    var attacker: AttackerProtocol?
    
    func attack() {
        guard let att = self.attacker else {
            print("\(self.name) attacker is nil")
            return}
        
        att.attackWay()
    }
    
    func attackWay() {
        print("\(self.name) use Player_B Attack")
    }
    
    //DefenceProtocol
    
    var name: String
    
    var defencer: DefenceProtocol?
    
    func defence(instance : DefenceProtocol, attacker : AttackerProtocol & DefenceProtocol) {
        guard let defence = self.defencer else {
            instance.defecneWay(attacker: attacker)
            return
        }
        
        defence.defecneWay(attacker: attacker)
    }
    
    func defecneWay(attacker : AttackerProtocol & DefenceProtocol) {
        print("\(self.name) defence \(attacker.name) with Player_B Style")
    }
    
    init(name : String){
        self.name = name
        self.attacker = self
        self.defencer = self
    }

}

let playerA : Player_A = Player_A(name: "Minsu")
let playerB : Player_B = Player_B(name: "Chulsu")

playerA.attack() // Minsu use Player_A Attack
playerB.attack() // Chulsu use Player_B Attack

playerA.defence(instance: playerB, attacker: playerB) // Minsu defence Chulsu with Player_A Style
playerB.defence(instance: playerA, attacker: playerA) // Chulsu defence Minsu with Player_B Style

playerA.attacker = playerB
playerA.attack() // Chulsu use Player_B Attack
playerA.attacker?.attack() // Chulsu use Player_B Attack

playerB.defencer = nil
playerB.defence(instance: playerA, attacker: playerA) // Minsu defence Minsu with Player_A Style


protocol ReceiveableProtocol{
    func received(data : Any, from : SendableProtocol)
}

protocol SendableProtocol{
    
    //SendableProtocol을 준수하는 인스턴스가 들어 올 수 있음
    var from : SendableProtocol {get}
    //ReceiveableProtocol을 준수하는 인스턴스가 들어 올 수 있음 - class나 Struct, enum만 가능할 줄 알았는데 Protocol도 가능ㅎ
    var to : ReceiveableProtocol? {get}
    
    func send(data: Any)
    
    //static class 모두 타입 프로퍼티인데
    //static은 상속이 불가능하고 //class는 상속이 가능하다.
    //하지만 프로토콜에서는 static으로 일단 해줘야한다.
    static func isSendableInstance(_ instance : Any) -> Bool
    
}

class Message : SendableProtocol , ReceiveableProtocol {
    
    var name : String = "Message"
    
    var from: SendableProtocol {
        return self
    }
    
    var to: ReceiveableProtocol?
    
    func send(data: Any) {
        print("Message send")
        guard let receiver : ReceiveableProtocol = self.to else {
            print("Message has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        
        if let sendableInstance : SendableProtocol = instance as? SendableProtocol {
            // nil 이면 true 아니면 false
            return sendableInstance.to != nil
        }
        
        return false
    }
    
    func received(data: Any, from: SendableProtocol) {
        print("Message received \(data) from \(from)")
    }
    
}

class Mail : SendableProtocol , ReceiveableProtocol {
    
    //이렇게 {return}을 해주면 get-only 프로퍼티 프로토콜이 된다.
    var from : SendableProtocol{
        return self
    }
    
    var what : SendableProtocol?
    
    var to : ReceiveableProtocol?
    
    func send(data: Any) {
        
        print("Mail send")
        guard let receiver : ReceiveableProtocol = self.to else {
            print("Mail has no receiver")
            return
        }
        
        receiver.received(data: data, from: self.from)
        
    }
    
    func received(data: Any, from: SendableProtocol) {
        print("Mail received \(data) from \(from)")
    }
    
    class func isSendableInstance(_ instance: Any) -> Bool {
        if let snedableInstance : SendableProtocol = instance as? SendableProtocol {
            // nil 이면 true 아니면 false
            return snedableInstance.to != nil
        }
        
        return false
    }
    
}

//두개의 인스턴스를 생성한다.
let myPhoneMessage : Message = Message()
let yourPhoneMessage : Message = Message()

let temp = myPhoneMessage.from // Message 타입을 반환한다.
myPhoneMessage.send(data: "Hello") // myPhoneMessage의 to가 없기 때문에 // Message has no receiver

myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello") // Message received Hello from __lldb_expr_52.Message

let myMail : Mail = Mail()
let yourMail : Mail = Mail()

myMail.send(data: "Hi") // Mail has no receiver

//Mail과 Message 모두 Sendable과 Receivable 프로토콜을 준수하므로
//서로 주고 받을 수 있습니다.

myMail.to = yourMail
myMail.send(data: "Hi") // Mail received Hi from __lldb_expr_56.Mail

myMail.to = myPhoneMessage
myMail.what = myPhoneMessage
print(myMail.what!) // __lldb_expr_64.Message
myMail.send(data: "Bye") // Message received Bye from __lldb_expr_64.Mail

// => 이것을 보아 Mail 인스턴스 이지만 실질적으로 receive 함수는 Mail이 아니라 Message를 따르는 것을 알 수 있다.
// 이것을 통해 프로토콜을 따르는 함수 일 경우에 그 함수는 클래스 내부의 함수를 따르는 것이 아니라
// 프로토콜의 함수를 따르게 된다. 따라서 동작이 다를 수 있음을 알아야 합니다.

// 왜냐하면 SendableProtocol을 준수하지 않았기 때문이다.
Message.isSendableInstance("Hello") // false

Message.isSendableInstance(myPhoneMessage) // myPhoneMessages는 to가 존재하기 때문에 true

Message.isSendableInstance(yourPhoneMessage) // yourPhoneMessage to가 존재하지 않기 때문에 false

Mail.isSendableInstance(myPhoneMessage) // true

Mail.isSendableInstance(myMail) // true

// 가변 메서드 요구 프로토콜

protocol ResettableProtocol{
    //Mutating이 들어간 것으로 보아 내부 프로퍼티를 변경 할 것이라는 걸 암
    mutating func reset()
}

class Person : ResettableProtocol{
    
    var name : String?
    var age : Int?
    
    //class는 내부 프로퍼티를 변경 할때, 굳이 mutating이 필요가 없다.
    func reset() {
        self.name = nil
        self.age = nil
    }
    
}

struct Point : ResettableProtocol{
    var x : Int  = 0
    var y : Int = 0
    
    //반면에 struct는 값 타입이기 때문에 이렇게 mutating을 해줘야 한다.
    mutating func reset() {
        self.x = 0
        self.y = 0
    }
}

enum Direction : ResettableProtocol {
    case east , west , south, north, unkown
    
    //Enum도 마찮가지이다. 값 타입이기 때문에 Mutating을 해줘야 한다.
    mutating func reset() {
        self = Direction.unkown
    }
}

// 이니셜라이저 요구

protocol Named {
    var name : String {get}
    init(name : String)
}

struct Pet : Named{
    var name : String
    
    //구조체는 상속 할 수 없기 때문에 이니셜라이저 요구에 큰 상관없이 사용해주면 된다.
    init(name : String){
        self.name = name
    }
    
}

let pet = Pet(name: "Name - pet")
pet.name

class Person2 : Named{
    
    var name : String
    
    //하지만 클래스일 경우에는 상속을 받을 수도 있기 때문에
    //required가 들어가게 된다.
    required init(name: String) {
        self.name = name
    }
    
}

final class Person3 : Named{
    var name : String
    //하지만 클래스가 이렇게 상속 받을 수 없는 final로 되어 있다면
    //required가 붙지 않는다.
    init(name: String) {
        self.name = name
    }
}

class A {
    var name : String
    
    init(name : String){
        self.name = name
    }
}

class B : A , Named{
    
    //Initializer requirement 'init(name:)' can only be satisfied by a 'required' initializer in non-final class 'B'
    //이렇게 상속 받은 곳에 프로토콜에서 정의 한 것과 동일한 init()이 있다면
    // 위와 같은 오류가 발생한다.
    //왜냐하면 중복이 되었으니깐, 그래서 required override를 사용해서
    //프로토콜을 준수하는 동시에 A 클래스를 override 해주도록 해야한다.
    required override init(name: String) {
        super.init(name: name)
    }
}

//MARK : 프로토콜 조합

protocol one {
    var one : String {get}
}

protocol two {
    var two : Int {get}
}

struct Ship : one , two {
    var one : String
    var two : Int
}

struct airPlane : one{
    var one : String
}

class Car : one{
    var one : String
    
    init(name : String){
        self.one = name
    }
}

class Truck : Car , two{
    var two : Int
    
    init(name : String , age : Int){
        self.two = age
        super.init(name: name)
    }
}

//조합을 하게 된다면 아래 처럼 접근이 가능하다.
func celebrateBirthDay(to celebrator  : one & two){
    //one & two 모두 준수하기 녀석이 들어오기 때문에 아래 처럼 각 부분에 접근이 가능하다.
    print("Happty BirthDay \(celebrator.one)!! \n Now you are \(celebrator.two)")
}

let yahagom : Ship = Ship(one: "yahagom", two: 99)
//이렇게 yahagom은 Ship 자체가 one two 프로토콜을 모두 상속 받기 때문에 사용 될 수 있다.
celebrateBirthDay(to: yahagom)

let myCar : Car = Car(name: "벤츠")
//celebrateBirthDay(to: myCar) // 반면 myCar는 two를 준수하지 않았기 때문에 접근 할 수 없다.

//그리고 아래 처럼 클래스와 프로토콜 조합도 가능하다.
//이렇게 했을 경우에는 Car 타입이면서 two를 준수하는 인스턴스가 와야한다.
//그래서 Car를 상속 받고 있으면서도 two를 준수하고 있는 Truck은 가능하다.
var classAndProtocol : Car & two = Truck(name: "truck", age: 99)

//하지만 클래스 타입은 한 타입만 가능하다.
//Protocol-constrained type cannot contain class 'Infomation' because it already contains class 'Car'
//그래서 이미 Car 클래스를 포함하고 있기 때문에 Infomation은 들어 올 수 없다고 하는 것이다.
//var twoClassAndProtocol : Car & Infomation & two

// 프로토콜 선택적 요구
// - 프로토콜을 선택적으로 적용하려고 할 때 이렇게 해준다.

@objc protocol Moveable {
    func walk()
    //선택적인 프로토콜은 이렇게 해준다.
    @objc optional func fly()
}

class Tiger : Moveable {
    
    func walk() {
        print("Tiger walk")
    }
    
}

class Bird : Moveable {
    func walk() {
        print("Bird Walk")
    }
    
    func fly(){
        print("Bird Flys")
    }
}

let tiger : Tiger = Tiger()
let bird : Bird = Bird()

tiger.walk()
bird.walk()

bird.fly()

var movableInstance : Moveable = tiger
movableInstance.fly?() //nil

movableInstance = bird
movableInstance.fly?()







//MARK : Optional Chaning

class Room{
    var number : Int
    
    init(number : Int){
        self.number = number
    }
    
    enum Kind{
        case negative
        case positive
        case zero
    }
    
    func kindOfnumber() -> Kind{
        switch number {
        
        case 0 :
            return .zero
        
        case let x where x % 2 == 0:
            print(x)
            return .negative
            
        default:
            return .positive
        }
    }
    
}

extension Room.Kind{

    var isRoomEmpty : Bool {
        
        switch self {
        case .negative:
            return false
        default:
            return true
        }
        
    }
    
}


class Building{
    var name : String
    var detail : String?
    var room : Room?
    
    init(name : String, detail : String?){
        self.name = name
        self.detail = detail
    }
    
    private func isRoomExist() -> Bool {
        return room == nil ? false : true
    }
    
    func resetRoom(number : Int) -> Room {
        
        let newRoom = Room(number: number)
        self.room = newRoom
        
        return self.room!
        
    }
    
    func makeRoom(number : Int) -> Room {
        
        if isRoomExist() {
            return self.room!
        }
        
        let newRoom = Room(number: number)
        self.room = newRoom
        
        return self.room!
        
    }
}

struct Address{
    
    var province : String
    var city : String
    var building : Building?
    
    init(province : String , city : String){
        self.province = province
        self.city = city
    }
    
    //이렇게 반환형을 특정 타입으로 해주면 연결형으로 사용 할 수 있다.! 개꿀!
   mutating func makeBuilding(name : String, detail : String?) -> Building{
        
        if self.building != nil {
            return self.building!
        }
        
        let newBuilding = Building(name: name, detail: detail)
        
        self.building = newBuilding
        
        return self.building!
    }
    
    func fullAddress() -> String? {
        
        //이 부분이 옶셔널 체이닝이다.
        //꾸준히 확인해서 존재하면 패스하고 그게 아니면 멈추게 된다.
        guard let buildingExist = building?.room else {return nil}
        
        return "\(province) + \(city) + \(building!.name) + \(buildingExist.number)"
        
    }
    
}

class Infomation{
    var name : String
    //이렇게 해서 연결형 구조를 만들 수 있다.
    var address : Address?
    
    init(name : String){
        self.name = name
    }
}

let chapchap : Infomation = Infomation(name: "ChapChap")

chapchap.address = Address(province: "대한민국", city: "서울")
chapchap.address?.makeBuilding(name: "은평뉴타운", detail: "629")

if let exist = chapchap.address?.building{
    print(exist.name)
}
else{
    print("중간에 값이 없는 것이 있습니다.")
}

chapchap.address?.makeBuilding(name: "은평뉴타운", detail: "629").makeRoom(number: 1202).number
chapchap.address?.makeBuilding(name: "청구아파트", detail: "420").resetRoom(number: 629).kindOfnumber().isRoomEmpty
chapchap.address?.fullAddress()
chapchap.address?.fullAddress()?.isEmpty

